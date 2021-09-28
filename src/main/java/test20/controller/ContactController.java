package test20.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import test20.dao.ContactDao;
import test20.dto.ContactDto;

@Controller
public class ContactController {

	@Autowired
	private ContactDao cdao;
	
	@RequestMapping("contactSave")
	public String contactSave(@ModelAttribute ContactDto contactinfo) throws Exception{
		cdao.contactSave(contactinfo);
		
		return "redirect:/";
	}
	

	
	
}
