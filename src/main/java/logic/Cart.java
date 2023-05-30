package logic;

import java.util.ArrayList;
import java.util.List;

public class Cart {
	private List<ItemSet> itemSetList = new ArrayList<>();
	public List<ItemSet> getItemSetList() {
		return itemSetList;
	}
	public void push(ItemSet itemSet) {
		//itemSet : 추가될 item
		int count = itemSet.getQuantity();
		for(ItemSet old : itemSetList) {
			//old : 추가되어 있는 item
			if(itemSet.getItem().getId() == old.getItem().getId()) {
				count = old.getQuantity() + itemSet.getQuantity();
				old.setQuantity(count);
				return;
			}
		}
	   itemSetList.add(itemSet);
	}
	public int getTotal() {
//		int sum = 0;
//		for(ItemSet s :itemSetList)
//			sum += s.getItem().getPrice() * s.getQuantity();
//		return sum; //전체금액 리턴
		return itemSetList.stream()
				.mapToInt(s->s.getItem().getPrice() * s.getQuantity())
				.sum();
	}
}
