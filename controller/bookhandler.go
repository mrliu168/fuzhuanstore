package controller

import (
	"fuzhaungstore/dao"
	"fuzhaungstore/model"
	"fmt"
	"html/template"
	"net/http"
	"strconv"
)

// IndexHandler 去首页
// func IndexHandler(w http.ResponseWriter, r *http.Request) {
// 	//获取页码
// 	pageNo := r.FormValue("pageNo")
// 	if pageNo == "" {
// 		pageNo = "1"
// 	}
// 	//调用bookdao中获取带分页的服装的函数
// 	page, _ := dao.GetPageBooks(pageNo)
// 	//解析模板
// 	t := template.Must(template.ParseFiles("views/index.html"))
// 	//执行
// 	t.Execute(w, page)
// }

//GetPageBooksByPrice 获取带分页和价格范围的服装
func GetPageBooksByPrice(w http.ResponseWriter, r *http.Request) {
	//获取页码
	pageNo := r.FormValue("pageNo")
	//获取价格范围
	minPrice := r.FormValue("min")
	maxPrice := r.FormValue("max")
	if pageNo == "" {
		pageNo = "1"
	}
	var page *model.Page
	if minPrice == "" && maxPrice == "" {
		//调用bookdao中获取带分页的服装的函数
		page, _ = dao.GetPageBooks(pageNo)
	} else {
		//调用bookdao中获取带分页和价格范围的服装的函数
		page, _ = dao.GetPageBooksByPrice(pageNo, minPrice, maxPrice)
		//将价格范围设置到page中
		page.MinPrice = minPrice
		page.MaxPrice = maxPrice
	}
	//调用IsLogin函数判断是否已经登录
	flag, session := dao.IsLogin(r)

	if flag {
		//已经登录，设置page中的IsLogin字段和Username的字段值
		page.IsLogin = true
		page.Username = session.UserName
	}
	fmt.Println(page)
	//解析模板文件
	t := template.Must(template.ParseFiles("views/index.html"))
	//执行
	t.Execute(w, page)
}

//GetPageBooks 获取带分页的服装
func GetPageBooks(w http.ResponseWriter, r *http.Request) {
	//获取页码
	pageNo := r.FormValue("pageNo")
	if pageNo == "" {
		pageNo = "1"
	}
	//调用bookdao中获取带分页的服装的函数
	page, _ := dao.GetPageBooks(pageNo)
	//解析模板文件
	t := template.Must(template.ParseFiles("views/pages/manager/book_manager.html"))
	//执行
	t.Execute(w, page)
}

//GetBooks 获取所有服装
func GetBooks(w http.ResponseWriter, r *http.Request) {
	//调用bookdao中获取所有服装的函数
	books, _ := dao.GetBooks()
	//解析模板文件
	t := template.Must(template.ParseFiles("views/pages/manager/book_manager.html"))
	//执行
	t.Execute(w, books)
}

//AddBook 添加服装
func AddBook(w http.ResponseWriter, r *http.Request) {
	//获取服装信息
	title := r.PostFormValue("title")
	author := r.PostFormValue("author")
	price := r.PostFormValue("price")
	sales := r.PostFormValue("sales")
	stock := r.PostFormValue("stock")
	//将价格、销量和库存进行转换
	fPrice, _ := strconv.ParseFloat(price, 64)
	iSales, _ := strconv.ParseInt(sales, 10, 0)
	iStock, _ := strconv.ParseInt(stock, 10, 0)
	//创建Book
	book := &model.Book{
		Title:   title,
		Author:  author,
		Price:   fPrice,
		Sales:   int(iSales),
		Stock:   int(iStock),
		ImgPath: "/static/img/default.jpg",
	}
	//调用bookdao中添加服装的函数
	dao.AddBook(book)
	//调用GetBooks处理器函数再次查询一次数据库
	GetBooks(w, r)
}

//DeleteBook 删除服装
func DeleteBook(w http.ResponseWriter, r *http.Request) {
	//获取要删除的服装的id
	bookID := r.FormValue("bookId")
	//调用bookdao中删除服装的函数
	dao.DeleteBook(bookID)
	//调用GetBooks处理器函数再次查询一次数据库
	GetPageBooks(w, r)
}

//ToUpdateBookPage 去更新或者添加服装的页面
func ToUpdateBookPage(w http.ResponseWriter, r *http.Request) {
	//获取要更新的服装的id
	bookID := r.FormValue("bookId")
	//调用bookdao中获取服装的函数
	book, _ := dao.GetBookByID(bookID)
	if book.ID > 0 {
		//在更新服装
		//解析模板
		t := template.Must(template.ParseFiles("views/pages/manager/book_edit.html"))
		//执行
		t.Execute(w, book)
	} else {
		//在添加服装
		//解析模板
		t := template.Must(template.ParseFiles("views/pages/manager/book_edit.html"))
		//执行
		t.Execute(w, "")
	}
}

//UpdateOrAddBook 更新或添加服装
func UpdateOrAddBook(w http.ResponseWriter, r *http.Request) {
	//获取服装信息
	bookID := r.PostFormValue("bookId")
	title := r.PostFormValue("title")
	author := r.PostFormValue("author")
	price := r.PostFormValue("price")
	sales := r.PostFormValue("sales")
	stock := r.PostFormValue("stock")
	//将价格、销量和库存进行转换
	fPrice, _ := strconv.ParseFloat(price, 64)
	iSales, _ := strconv.ParseInt(sales, 10, 0)
	iStock, _ := strconv.ParseInt(stock, 10, 0)
	ibookID, _ := strconv.ParseInt(bookID, 10, 0)
	//创建Book
	book := &model.Book{
		ID:      int(ibookID),
		Title:   title,
		Author:  author,
		Price:   fPrice,
		Sales:   int(iSales),
		Stock:   int(iStock),
		ImgPath: "/static/img/default.jpg",
	}
	if book.ID > 0 {
		//在更新服装
		//调用bookdao中更新服装的函数
		dao.UpdateBook(book)
	} else {
		//在添加服装
		//调用bookdao中添加服装的函数
		dao.AddBook(book)
	}
	//调用GetBooks处理器函数再次查询一次数据库
	GetPageBooks(w, r)
}
