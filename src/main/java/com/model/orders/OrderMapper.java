package com.model.orders;

public interface OrderMapper {

	int createOrder(OrdersDTO dto); // orderno 리턴

	void createDetail(OrderdetailDTO odto);

	int addOrder(OrdersDTO odto);

}
