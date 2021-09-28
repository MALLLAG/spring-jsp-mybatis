package test20.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;


import test20.dao.MessageDao;
import test20.dto.BoardDto;
import test20.dto.MessageDto;
import test20.dto.ReplyDto;

@Controller
public class MessageController {

	@Autowired
	private MessageDao mdao;

	
	 @RequestMapping("messagebox") 
	 public String messageList(Model model, String rno) throws Exception{
		 List<MessageDto> list = mdao.selectMessageList(rno);
		 model.addAttribute("messagelist", list);
		 return "messagebox/messagebox";
	 
	 }
	 
	 @RequestMapping("messageForm")
	 public String messageSearch(Model model, String rno) throws Exception{
		 MessageDto dto = mdao.selectMessageOne(rno);
		 model.addAttribute("messageInfo", dto);
		 return "messagebox/messageForm";
	 }
	 
	 @RequestMapping("/messageSend")
	 public String messageInsert(@ModelAttribute MessageDto dto) throws Exception{
		 mdao.insertMessage(dto);
		 
		 return "redirect:/userList";
	 }

		@RequestMapping("/messageDelete")
	   	public String replyDelete(HttpServletRequest request) 
	   			throws Exception {
	    	String messageno = request.getParameter("messageno");    	
	    	mdao.deleteMessage(messageno);
	        
	        return "messagebox/messagebox";
		}
	 
		@RequestMapping("/messageRead")
		public String messageRead(HttpServletRequest requset, Model model) throws Exception{
			String messageno = requset.getParameter("messageno");
			MessageDto messageInfo = mdao.messageRead(messageno);
			model.addAttribute("messageInfo", messageInfo);
			return "messagebox/messageRead";
		}
}




