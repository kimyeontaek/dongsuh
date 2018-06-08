package dongsuh.vo;

public class BasketVO {

	String itemNameS, odate, id;
	int itemPriceS, itemNumberS;
	String[] itemName, itemPrice, itemNumber;
	String[] basketCheckbox;
	String[] hname;
	int[] hprice, hnum;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getOdate() {
		return odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}

	public String[] getHname() {
		return hname;
	}

	public void setHname(String[] hname) {
		this.hname = hname;
	}

	public int[] getHprice() {
		return hprice;
	}

	public void setHprice(int[] hprice) {
		this.hprice = hprice;
	}

	public int[] getHnum() {
		return hnum;
	}

	public void setHnum(int[] hnum) {
		this.hnum = hnum;
	}

	public String[] getBasketCheckbox() {
		return basketCheckbox;
	}

	public void setBasketCheckbox(String[] basketCheckbox) {
		this.basketCheckbox = basketCheckbox;
	}

	public String[] getItemName() {
		return itemName;
	}

	public void setItemName(String[] itemName) {
		this.itemName = itemName;
	}

	public String[] getItemPrice() {
		return itemPrice;
	}

	public void setItemPrice(String[] itemPrice) {
		this.itemPrice = itemPrice;
	}

	public String[] getItemNumber() {
		return itemNumber;
	}

	public void setItemNumber(String[] itemNumber) {
		this.itemNumber = itemNumber;
	}

	public String getItemNameS() {
		return itemNameS;
	}

	public void setItemNameS(String itemNameS) {
		this.itemNameS = itemNameS;
	}

	public int getItemPriceS() {
		return itemPriceS;
	}

	public void setItemPriceS(int itemPriceS) {
		this.itemPriceS = itemPriceS;
	}

	public int getItemNumberS() {
		return itemNumberS;
	}

	public void setItemNumberS(int itemNumberS) {
		this.itemNumberS = itemNumberS;
	}

}