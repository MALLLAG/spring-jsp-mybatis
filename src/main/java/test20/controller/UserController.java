package test20.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import test20.dto.BoardDto;
import test20.dto.ContactDto;
import test20.dto.RatingDto;
import test20.dto.UserDTO;
import test20.dao.RatingDao;
import test20.dao.UserDao;
import test20.dto.ContactDto;
import test20.dao.ContactDao;

@Controller
public class UserController {
	
	@Inject
	private UserDao dao;
	
	@Inject
	private RatingDao rdao;

	@Inject ContactDao cdao;
	
	String checkno = null;
	
	@RequestMapping(value="joinForm")
	public String joinForm() throws Exception{
		return "user/joinForm";
	}
	
	@RequestMapping(value="saveForm", method=RequestMethod.POST)
	public String postsaveForm(UserDTO dto, MultipartHttpServletRequest req) throws Exception{
		
		String fileName = req.getParameter("file");
        MultipartFile mf = req.getFile("file");
		
		if (!mf.isEmpty()) {
			fileName = mf.getOriginalFilename();						
			mf.transferTo(new File(new File(System.getProperty("catalina.base")).getParentFile().getParentFile().getParentFile().getParent() + "\\test20\\src\\main\\webapp\\views\\image\\" + fileName));
		}
		
		if(fileName==null) {
			dto.setImg("views\\image\\2513B53E55DB206927.png");
		}else {
		dto.setImg("views\\image\\" + fileName);
		}
		
		dao.saveForm(dto);
		return "index";
	}
	
	@RequestMapping(value="updateForm")
	public String updateForm(UserDTO dto) throws Exception{
		return "user/updateForm";
	}
	
	@RequestMapping(value="updateSaveForm", method=RequestMethod.POST)
	public String updateSaveForm(HttpServletRequest req, MultipartHttpServletRequest mreq, UserDTO dto) throws Exception{
		if(dto != null) {

			String fileName = mreq.getParameter("file");
	        MultipartFile mf = mreq.getFile("file");
			
			if (!mf.isEmpty()) {
				fileName = mf.getOriginalFilename();						
				mf.transferTo(new File("c:\\image\\" + fileName));
			}
			if(fileName==null) {
				dto.setImg("views\\image\\2513B53E55DB206927.png");
			}else {
			dto.setImg("views\\image\\" + fileName);
			}
			
			HttpSession session = req.getSession();
			UserDTO update = new UserDTO(checkno, dto.getName(), dto.getEmail(), dto.getPassword(), dto.getPhonnumber(), "USER", dto.getAddress(), dto.getImg(), dto.getAvg());

			session.setAttribute("userno", update.getUserno());
			session.setAttribute("name", update.getName());
			session.setAttribute("email", update.getEmail());
			session.setAttribute("phonnumber", update.getPhonnumber());
			session.setAttribute("address", update.getAddress());
			session.setAttribute("img", update.getImg());
			dao.updateForm(update);
		}
		return "index";
	}
	
	@RequestMapping(value="loginForm")
	public String loginForm() throws Exception{
		return "user/loginForm";
	}
	
	@RequestMapping(value="login", method=RequestMethod.POST)
	public String postloginForm(HttpServletRequest req, UserDTO dto) throws Exception{
		HttpSession session = req.getSession();
		UserDTO login = dao.login(dto);
		checkno = dao.userInfo(dto);
		
		if(login.getUserno().equals(checkno)) {
				session.setAttribute("userno",login.getUserno());
				session.setAttribute("name", login.getName());
				session.setAttribute("email", login.getEmail());
				session.setAttribute("phonnumber", login.getPhonnumber());
				session.setAttribute("roletype", login.getRoletype());
				session.setAttribute("address", login.getAddress());
				session.setAttribute("img", login.getImg());
			
		}else {
			session.setAttribute("dto", null);
		}
		return "redirect:/";
	}
	
	@RequestMapping(value="logout")
	public String logout(HttpSession session) {
		session.invalidate();
		
		return "redirect:/";
	}
	
	@RequestMapping(value="userInfo")
	public String userInfo() throws Exception{
		return "user/userInfo";
	}
	
	
	@RequestMapping(value="adminInfo")
	public String adminInfo() throws Exception{
		return "user/adminInfo";
	}
	
	@RequestMapping("/userList")
	public String userList(Model model) throws Exception{
		
		List<UserDTO> list = dao.selectUserList();
		model.addAttribute("userlist", list);

		return "user/userList";
	}
	
	   @RequestMapping(value="findId")
	   public String findId() throws Exception{
	      return "user/find/findId";
	   }
	   
	   @RequestMapping(value="findIdAfter")
	   public String findIdAfter(Model model, UserDTO dto) throws Exception{
		   String findIdAfter = dao.findIdAfter(dto);
		   model.addAttribute("findIdAfter", findIdAfter);
		   return "user/find/findIdAfter";
	   }

	   
		@RequestMapping("/check")
		public String check(Model model, String name) throws Exception{
			model.addAttribute("name", name);
			int check = dao.check(name);
			model.addAttribute("check", check);
			return "user/check";
		}
		
		@RequestMapping("/emailcheck")
		public String emailcheck(Model model, String email) throws Exception{
			model.addAttribute("email", email);
			int emailcheck = dao.emailcheck(email);
			model.addAttribute("emailcheck", emailcheck);
			return "user/emailcheck";
		}
		
		
		
		   @RequestMapping(value="findPassword")
		   public String findPassword() throws Exception{
		      return "user/find/findPassword";
		   }
		   
		   @RequestMapping(value="findPasswordAfter")
		   public String findPasswordAfter(Model model, UserDTO dto) throws Exception{
			   String findPasswordAfter = dao.findPasswordAfter(dto);
			   model.addAttribute("findPasswordAfter", findPasswordAfter);
			   return "user/find/findPasswordAfter";
		   }

			@RequestMapping(value="deleteUser")
		   	public String boardDelete(HttpServletRequest request) 
		   			throws Exception {
		    	String userno = request.getParameter("userno");    	
		    	dao.deleteUser(userno);
		        
		        return "redirect:/logout";
			}
		

}		
