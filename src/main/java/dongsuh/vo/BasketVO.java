package dongsuh.vo;

public class BasketVO {

	String name, odate, id;
	int num, price;
	String[] basketCheckbox;
	String[] hname;
	int[] hprice, hnum;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getOdate() {
		return odate;
	}

	public void setOdate(String odate) {
		this.odate = odate;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String[] getBasketCheckbox() {
		return basketCheckbox;
	}

	public void setBasketCheckbox(String[] basketCheckbox) {
		this.basketCheckbox = basketCheckbox;
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

}