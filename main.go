package main

import (
	"fmt"
	"fuzhaungstore/controller"
	"net/http"
)

func main() {
	//设置处理静态资源，如css和js文件
	http.Handle("/static/", http.StripPrefix("/static/", http.FileServer(http.Dir("./views/static"))))
	//直接去html页面
	http.Handle("/pages/", http.StripPrefix("/pages/", http.FileServer(http.Dir("./views/pages"))))
	//去首页
	http.HandleFunc("/", controller.GetPageBooksByPrice)
	//去登录
	http.HandleFunc("/login", controller.Login)
	//去注销
	http.HandleFunc("/logout", controller.Logout)
	//去注册
	http.HandleFunc("/regist", controller.Regist)
	//通过Ajax请求验证用户名是否可用
	http.HandleFunc("/checkUserName", controller.CheckUserName)
	//获取所有服装
	// http.HandleFunc("/getBooks", controller.GetBooks)
	//获取带分页的服装信息
	http.HandleFunc("/getPageBooks", controller.GetPageBooks)
	http.HandleFunc("/getPageBooksByPrice", controller.GetPageBooksByPrice)
	//添加服装
	// http.HandleFunc("/addBook", controller.AddBook)
	//删除服装
	http.HandleFunc("/deleteBook", controller.DeleteBook)
	//去更新服装的页面
	http.HandleFunc("/toUpdateBookPage", controller.ToUpdateBookPage)
	//更新或添加服装
	http.HandleFunc("/updateOraddBook", controller.UpdateOrAddBook)
	//添加服装到购物车中
	http.HandleFunc("/addBook2Cart", controller.AddBook2Cart)
	//获取购物车信息
	http.HandleFunc("/getCartInfo", controller.GetCartInfo)
	//清空购物车
	http.HandleFunc("/deleteCart", controller.DeleteCart)
	//删除购物项
	http.HandleFunc("/deleteCartItem", controller.DeleteCartItem)
	//更新购物项
	http.HandleFunc("/updateCartItem", controller.UpdateCartItem)
	//去结账
	http.HandleFunc("/checkout", controller.Checkout)
	//获取所有订单
	http.HandleFunc("/getOrders", controller.GetOrders)
	//获取订单详情，即订单所对应的所有的订单项
	http.HandleFunc("/getOrderInfo", controller.GetOrderInfo)
	//获取我的订单
	http.HandleFunc("/getMyOrder", controller.GetMyOrders)
	//发货
	http.HandleFunc("/sendOrder", controller.SendOrder)
	//确认收货
	http.HandleFunc("/takeOrder", controller.TakeOrder)
	fmt.Println("请访问localhost:9001端口进入服装商城")
	http.ListenAndServe(":9001", nil)
}
