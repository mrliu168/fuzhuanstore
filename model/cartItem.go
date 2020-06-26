package model

//CartItem 购物项结构体
type CartItem struct {
	CartItemID int64   //购物项的id
	Book       *Book   //购物项中的服装信息
	Count      int64   //购物项中服装的数量
	Amount     float64 //购物项中服装的金额小计，通过计算得到
	CartID     string  //当前购物项属于哪一个购物车
}

//GetAmount 获取购物项中服装的金额小计，有服装的价格和服装的数量计算得到
func (cartItem *CartItem) GetAmount() float64 {
	//获取当前购物项中服装的价格
	price := cartItem.Book.Price
	return float64(cartItem.Count) * price
}
