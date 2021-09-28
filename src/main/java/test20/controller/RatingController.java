package test20.controller;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.stereotype.Controller;

import test20.dao.RatingDao;
import test20.dto.RatingDto;
import test20.dto.ReplyDto;
import test20.dto.UserDTO;
import test20.dao.UserDao;


@Controller
public class RatingController {

	@Inject
	private UserDao udao;
		
	@Inject
	private RatingDao adao;

	@RequestMapping("/adminRead")
	public String adminRead(HttpServletRequest request, Model model) throws Exception{
		String userno = request.getParameter("userno");
		UserDTO userInfo = udao.selectAdminOne(userno);
		String avg = udao.selectAdminAvg(userno);
		userInfo.setAvg(avg);
		model.addAttribute("userInfo", userInfo);
		
		String adminno = userno;
		List<RatingDto> list = adao.selectRatingList(adminno);
		model.addAttribute("ratinglist", list);
		
		
		
		HttpSession session = request.getSession();
		String sessionUserno = (String)session.getAttribute("userno");
		RatingDto dto = new RatingDto();
		dto.setAdminno(userno);
		dto.setUserno(sessionUserno);
		String count = adao.selectCount(dto);
		
		model.addAttribute("count", count);
		return "user/adminRead";
	}
		
		
		

	@RequestMapping("/insertRating")
	public String ratingInsert(RatingDto ratinginfo) throws Exception{
		adao.insertRating(ratinginfo);
		return "redirect:/";
	}
	
	@RequestMapping("/ratingDelete")
   	public String deleteRating(HttpServletRequest request) 
   			throws Exception {
    	String ratingno = request.getParameter("ratingno");    	
    	adao.deleteRating(ratingno);
        
        return "index";
	}
	
	
	
}
