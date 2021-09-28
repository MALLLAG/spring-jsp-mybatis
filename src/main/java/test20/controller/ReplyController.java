package test20.controller;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import test20.dao.BoardDao;
import test20.dao.ReplyDao;
import test20.dto.BoardDto;
import test20.dto.ReplyDto;

@Controller
public class ReplyController {

	@Inject
	private ReplyDao rdao;
	


	@RequestMapping("/insertReply")
	public String replySave(ReplyDto replyinfo) throws Exception{
		
		rdao.insertReply(replyinfo);
		return "boardList";
	}
	
	@RequestMapping("/replyDelete")
   	public void replyDelete(HttpServletRequest request) 
   			throws Exception {
    	String replyno = request.getParameter("replyno");    	
    	rdao.deleteReply(replyno);
	}
	
}
