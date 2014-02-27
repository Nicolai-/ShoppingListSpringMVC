package dk.mercantec.hot.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import dk.mercantec.hot.model.Item;
import dk.mercantec.hot.service.ItemJDBCTemplate;

@Controller
public class ShoppingListController {

	ApplicationContext context = new ClassPathXmlApplicationContext("Beans.xml");
	ItemJDBCTemplate itemJDBCTemplate = (ItemJDBCTemplate) context
			.getBean("itemJDBCTemplate");

	@RequestMapping(value = "/shoppingList", method = RequestMethod.GET)
	public String getShoppingList(Model model) {

		List<Item> items = itemJDBCTemplate.getShoppingListItems();
		model.addAttribute("items", items);
		return "shoppingList";
	}

	@RequestMapping(value = "/shoppingList", method = RequestMethod.POST)
	public String handleMyArrayVals(
			@RequestParam(value = "bought", required = false) int[] checkedIds,
			@RequestParam(value = "deleted", required = false) int[] deletedIds,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		itemJDBCTemplate.resetAllBought();

		System.out.println(checkedIds);
		if (checkedIds != null) {
			for (int idChecked : checkedIds) {
				System.out.println("Set Item ID: " + idChecked + "As Bought");
				itemJDBCTemplate.setItemBought(idChecked);
			}
		}
		if (deletedIds != null) {
			for (int deleteChecked : deletedIds) {
				System.out.println("Delete Item Id: " + deleteChecked);
				itemJDBCTemplate.deleteItem(deleteChecked);
			}
		}
		return "redirect:shoppingList.html";
	}

	@RequestMapping(value = "/addItem", method = RequestMethod.GET)
	public String addNewItem(Model model) {

		Item item = new Item();
		model.addAttribute("item", item);

		return "addItem";
	}

	@RequestMapping(value = "/addItem", method = RequestMethod.POST)
	public String addNewItem(@Valid @ModelAttribute("item") Item item,
			BindingResult result) {

		System.out.println("Result has erros: " + result.hasErrors());

		if (result.hasErrors()) {
			return "addItem";
		}

		itemJDBCTemplate.createItem(item.getName(), item.getPrice());

		return "redirect:shoppingList.html";
	}

}
