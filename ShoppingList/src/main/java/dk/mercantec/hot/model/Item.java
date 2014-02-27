package dk.mercantec.hot.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.hibernate.validator.constraints.Range;

/** 
 * A Simple Item onject for holding the data from the database
 * @author Nicolai
 *
 */
public class Item {
	
	private int id;
	@NotEmpty //Constraint that makes sure the Field name is not empty
	private String name;
	private boolean bought;
	@Range(min = 1, max = 3000) //Constraint that makes sure that the Field Price is in the range
	private Integer price;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public boolean isBought() {
		return bought;
	}
	public void setBought(boolean bought) {
		this.bought = bought;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}

}
