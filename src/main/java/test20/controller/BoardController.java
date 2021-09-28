package test20.controller;


import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import test20.dao.BoardDao;
import test20.dao.ReplyDao;
import test20.dto.BoardDto;
import test20.dto.Pagination;
import test20.dto.ReplyDto;

@Controller
public class BoardController {
	
	@Autowired
	private BoardDao dao;
	
	@Inject
	private ReplyDao rdao;

	@RequestMapping({"","/"})
	public String index() {
		return "index";
	}
	
	@RequestMapping("/boardList")
	public String boardList(@RequestParam(defaultValue="1") int curPage, Model model) throws Exception{
		List<BoardDto> list = dao.selectBoardList();
		int listCnt = list.size();
        
        Pagination pagination = new Pagination(listCnt, curPage);
        
        List<BoardDto> listcut = new ArrayList<BoardDto>();
        
        int checknum = 0;
        if(curPage != 1) {
        	checknum = (curPage-1)*15;
        }
        int j = 0;
	    for(int i=checknum; i<curPage*15; i++) {
	      	listcut.add(j, list.get(i));
	      	j++;
	      	if(i+1 == listCnt) {
	       		break;
	       	}
	    }
        
		model.addAttribute("list", listcut);
        model.addAttribute("listCnt", listCnt);
        model.addAttribute("pagination", pagination);
		return "boardList";
	}
	
	@RequestMapping(value="/selectSearchList", method=RequestMethod.POST)
	public String selectSearch(Model model, String select, String search) throws Exception{
		List<BoardDto> list = dao.selectSearchList(select, search);
		model.addAttribute("list", list);
		return "boardList";
	}

	@RequestMapping("/boardRead")
	public String boardRead(HttpServletRequest request, Model model) throws Exception{
		String boardno = request.getParameter("boardno");
		BoardDto boardInfo = dao.selectBoardOne(boardno);
		model.addAttribute("boardInfo", boardInfo);
		
		List<ReplyDto> list = rdao.selectReplyList(boardno);
		model.addAttribute("replylist", list);
		
		return "boardRead";
	}
	
	@RequestMapping("/boardForm")
	public String boardForm() throws Exception{
		return "boardForm";
	}
	
	@RequestMapping("/boardSave")
	public String boardSave(@ModelAttribute BoardDto boardinfo) throws Exception{
		dao.insertBoard(boardinfo); 

        return "redirect:/boardList";
	}
	

	@RequestMapping("/boardUpdate")
	public String boardUpdate(HttpServletRequest request, ModelMap modelMap) throws Exception{
		String boardno = request.getParameter("boardno");
		BoardDto boardInfo = dao.selectBoardOne(boardno);
		modelMap.addAttribute("boardInfo",boardInfo);
		
		return "boardUpdate";
	}
	@RequestMapping("/boardUpdateSave")
   	public String viewsUpdateSave(@ModelAttribute BoardDto boardInfo) 
   			throws Exception {    	
    	dao.updateBoard(boardInfo);    	
        return "redirect:/boardList";
    }
	
	@RequestMapping("/boardDelete")
   	public String boardDelete(HttpServletRequest request) 
   			throws Exception {
    	String boardno = request.getParameter("boardno");    	
    	dao.deleteBoard(boardno);
        
        return "redirect:/boardList";
	}
	
	


}

