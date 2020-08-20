package com.mycompany.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.mycompany.domain.BookVO;
import com.mycompany.domain.CustomerVO;
import com.mycompany.domain.PaginationVO;
import com.mycompany.service.AdminServiceImpl;
import com.mycompany.service.BookServiceImpl;
import com.mycompany.service.WriterServiceImpl;
import com.mycompany.util.Sales;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	WriterServiceImpl writerService;
	@Autowired
	BookServiceImpl bookService;
	@Autowired
	AdminServiceImpl adminService;
	
	/* 
	 * 함수 이름 : moveToAdminDashboard
	 * 주요 기능 : 관리자 메인화면으로 보냄
	 * 함수 내용
	 * 		ㄴ 관리자가 로그인을 했는지 확인 후 관리자가 아니라면 로그인화면으로 보냄
	 */
	@RequestMapping("/admin/dashboard.do")
	public ModelAndView moveToAdminDashboard(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		CustomerVO customerVO = (CustomerVO) session.getAttribute("customer");
		if (customerVO == null || customerVO.getCustomerFlag() == 1) {
			mv.setViewName("redirect:/moveToLogin.do");
			return mv;
		}
		mv.setViewName("/admin/dashboard");
		return mv;
	}
	/* 
	 * 함수 이름 : loadLeftSidebar
	 * 주요 기능 : 왼쪽 사이드바를 로딩함
	 * 함수 내용 : --
	 */
	@RequestMapping("/admin/leftSidebar.do")
	public ModelAndView loadLeftSidebar() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/leftSidebar");
		return mv;
	}
	/* 
	 * 함수 이름 : loadTopbar
	 * 주요 기능 : 왼쪽 top바를 로딩함
	 * 함수 내용 : --
	 */
	@RequestMapping("/admin/topbar.do")
	public ModelAndView loadTopbar() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/topbar");
		return mv;
	}
	/* 
	 * 함수 이름 : loadAdminWriter
	 * 주요 기능 : 저자 리스트 화면을 로딩함
	 * 함수 내용 : --
	 */
	@RequestMapping("/admin/writer.do")
	public ModelAndView loadAdminWriter() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_writer");
		return mv;
	}
	/* 
	 * 함수 이름 : loadAdminWriter
	 * 주요 기능 : 도서 리스트 화면을 로딩함
	 * 함수 내용 : --
	 */
	@RequestMapping("/admin/product.do")
	public ModelAndView loadAdminProduct() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_product");
		return mv;
	}
	/* 
	 * 함수 이름 : getWriterData
	 * 주요 기능 : 도서 리스트를 반환해줌
	 * 함수 내용 
	 * 		ㄴ jsp에서 검색어를 받아옴 (검색어가 없을 경우 -> 전체 검색)
	 * 		ㄴ 검색어로 검색한 도서 리스트와 리스트 크기를 json형태로 반환
	 */
	@RequestMapping(value = "/admin/getProductData.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getWriterData(HttpSession session, @RequestParam(value = "searchWord") String searchWord) {
		Map result = new HashMap();
		Map<String, String> search = new HashMap<String, String>();
		search.put("searchWord", searchWord);
		List<BookVO> bookList = bookService.searchListBook(search);
		result.put("bookList", bookList);
		result.put("bookListSize", bookList.size());
		return result;
	}
	/* 
	 * 함수 이름 : prodcutInsertPage
	 * 주요 기능 : 도서 등록 페이지를 불러옴
	 * 함수 내용 : --
	 */
	@RequestMapping(value = "/admin/loadInsertProduct.do")
	public ModelAndView prodcutInsertPage(HttpSession session, BookVO bookVO) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/admin_productInsert");
		return mv;
	}
	/* 
	 * 함수 이름 : productInsert
	 * 주요 기능 : 도서를 등록하고 도서 리스트 페이지로 이동함
	 * 함수 내용 : --
	 */
	@RequestMapping(value = "/admin/insertProduct.do")
	public ModelAndView productInsert(HttpSession session, BookVO bookVO) {
		ModelAndView mv = new ModelAndView();

		// 제품 등록해야되는 부분
		adminService.insertProduct(bookVO);
		mv.setViewName("/admin/admin_product");
		return mv;
	}
	/* 
	 * 함수 이름 : productDelete
	 * 주요 기능 : 도서를 삭제하고 도서 리스트 페이지로 이동함
	 * 함수 내용 : --
	 */
	@RequestMapping(value = "/admin/productDelete.do")
	public ModelAndView productDelete(HttpSession session, BookVO bookVO) {
		ModelAndView mv = new ModelAndView();
		adminService.deleteProduct(bookVO);
		mv.setViewName("/admin/admin_product");
		return mv;
	}
	/* 
	 * 함수 이름 : loadProductUpdatePage
	 * 주요 기능 : 도서 수정 페이지를 로딩함
	 * 함수 내용
	 * 		ㄴ 도서 수정 페이지를 로딩함
	 * 		ㄴ 도서 id를 같이 화면에 넘겨줌
	 */
	@RequestMapping(value = "/admin/loadProductUpdatePage.do")
	public ModelAndView loadProductUpdatePage(HttpSession session, int bookId) {
		ModelAndView mv = new ModelAndView();
		BookVO bookVO = new BookVO();
		bookVO.setBookId(bookId);
		bookVO = (BookVO) bookService.selectBook(bookVO);
		mv.addObject("bookVO", bookVO);
		mv.setViewName("/admin/admin_productUpdate");
		return mv;
	}
	/* 
	 * 함수 이름 : writerUpdate
	 * 주요 기능 : 도서 정보를 수정함
	 * 함수 내용
	 * 		ㄴ 받아온 도서 id에 해당하는 도서를 받아온 도서 정보로
	 */
	@RequestMapping(value = "/admin/productUpdatePage.do")
	public ModelAndView writerUpdate(HttpSession session, BookVO bookVO) {
		ModelAndView mv = new ModelAndView();
		adminService.updateProduct(bookVO);
		mv.setViewName("/admin/admin_product");
		return mv;
	}

	/* 
	 * 함수 이름 : loadAdminWindowWriter
	 * 주요 기능 : 사용하지않음
	 */
	@RequestMapping("/admin/admin_writer_window.do")
	public ModelAndView loadAdminWindowWriter() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_writer_window");
		return mv;
	}
	/* 
	 * 함수 이름 : loadTestWriter
	 * 주요 기능 : 페이징 기능이 추가된 저자 목록 페이지를 불러옴
	 * 함수 내용 : 검색 결과에 따른 동적으로 페이징 구성을 하는 저자 목록 페이지로 이동
	 * 			ㄴ 페이징 기능
	 * 				ㄴ 1. ajax 검색 결과가 30개 일경우 3페이지 구성, 120개일 경우 페이지 그룹 3, 페이지 12개 생성
	 * 				ㄴ 3. 맨 앞 페이지가 아닐 경우 -> 맨 앞 페이지로 이동
	 * 				ㄴ 4. 맨 뒤 페이지가 아닐 경우 -> 맨 뒤 페이지로 이동
	 * 				ㄴ 5. 5 페이지마다 grouping
	 */
	@RequestMapping("/admin/admin_writer_pagination.do")
	public ModelAndView loadTestWriter() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/admin/admin_writer_pagination");
		return mv;
	}
	/* 
	 * 함수 이름 : getSalesDataWithOptions
	 * 주요 기능 : 관리자 페이지의 차트 data를 구성함
	 * 함수 내용
	 * 		ㄴ 몇개의 data를 가져올 지(chartDataCnt) , data를 어느 단위로 볼지(option -> 년단위, 월단위, 일단위, 시간단위, 분단위, 초단위)를 jsp에서 가져옴
	 * 		ㄴ 숫자로 받아온 옵션(0~5) 를 {"YY", "YY/MM", "YY/MM/DD", "YY/MM/DD/HH24", "YY/MM/DD/HH24:MI", "YY/MM/DD/HH24:MI:SS"}로 변환함
	 * 		ㄴ 구매리스트를 원하는 범위단위(option)로 가져온 후 원하는 데이터만큼의 개수(chartDataCnt)를 넘겨줌
	 * 		ㄴ 위의 option과 chartDataCnt에 해당하는 데이터들을 가장 가까운 날짜부터 가져오되 오늘 날짜와 가장 멀리 떨어진 날짜부터 순서대로 정렬
	 * 사용하는 mapper : AdminMapper.xml -> selectSalesWithOptions
	 * 반환되는 위치 : admin_dashboard.js
	 */
	@RequestMapping(value = "/admin/getSalesDataWithOptions", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getSalesDataWithOptions(HttpSession session, @RequestParam(defaultValue = "3") int option,
			@RequestParam(defaultValue = "100") int chartDataCnt) {
		Map result = new HashMap();
		Map searchMap = new HashMap();
		searchMap.put("chartDataCnt", chartDataCnt); //0613 추가
		searchMap.put("selectOption", Sales.getInstance().changeIntOptionToString(option)); // 검색 옵션을 넣음(연도, 월별, 일별)
		List<Map> salesList = adminService.selectSalesWithOptions(searchMap);
		result.put("reducedSalesList", salesList); // 사용하지 않음(테스트용)
		result.put("reducedSalesListSize", salesList.size()); // 사용하지 않음(테스트용)

		return result;
	}

	/* 
	 * 함수 이름 : getGenreSalesData
	 * 주요 기능 : 관리자 페이지의 장르별 매출 pie차트 data를 구성함
	 * 함수 내용
	 * 		ㄴ 장르별 매출 총합을 piechartData로 구성하여 넘겨줌
	 * 반환되는 위치 : admin_pieChart.js
	 */
	@RequestMapping("/admin/getGenreSalesData.do")
	@ResponseBody
	public Map getGenreSalesData() {
		Map result = new HashMap();
		List<Map> list = adminService.getGenreSalesData();
		result.put("GenreSalesList", list);
		result.put("GenreSalesListSize", list.size());
		return result;
	}

	/* 
	 * 함수 이름 : getProductDataWithPaging
	 * 주요 기능 : 검색어와 현재 페이지를 입력받아 현재 페이지에 해당하는 목록을 넘겨줌
	 * 함수 내용
	 * 		ㄴ 검색어와 현재 페이지를 입력받아 현재 페이지에 해당하는 도서 목록을 넘겨줌
	 * 		ㄴ 페이징을 돕는 PaginationVO 사용
	 * 반환되는 위치 : admin_getProductDataWithPaging.js 
	 */
	@RequestMapping(value = "/admin/getProductDataWithPaging.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map getProductDataWithPaging(HttpSession session, @RequestParam(defaultValue = "1") int curPage,
			@RequestParam(value = "searchWord") String searchWord) {

		Map result = new HashMap();
		int listCnt = adminService.selectProductCntByNameWithPaging(searchWord);
		PaginationVO paginationVO = new PaginationVO(listCnt, curPage);
		Map searchMap = new HashMap();
		searchMap.put("searchWord", searchWord);
		searchMap.put("startRow", paginationVO.getStartIndex() + 1);
		searchMap.put("endRow", paginationVO.getStartIndex() + paginationVO.getPageSize());
		List<BookVO> bookList = adminService.selectProductSearchByNameWithPaging(searchMap);
		result.put("pagination", paginationVO);
		result.put("bookList", bookList);
		result.put("bookListSize", bookList.size());
		return result;
	}

	/* 
	 * 함수 이름 : selectProductListWithFiltering
	 * 주요 기능 : 도서 목록을 정렬, 필터링
	 * 함수 내용
	 * 		ㄴ 현재 페이지와 재고 개수, 정렬옵션, 정렬순서옵션을 받아와서 해당하는 데이터의 개수를 구함 -> searchMap1을 이용한 listCnt(데이터의 개수)를 구함
	 * 		ㄴ listCnt(데이터의 개수)와 현재 페이지를 paginationVO를 이용해서 현재페이지(curPage)에 해당하는 startRow, endRow를 구함
	 * 		ㄴ searchMap1에서 startRow와 endRow가 추가된 searchMap2로 필터링, 정렬된 데이터들을 가져와서 jsp페이지로 보내줌
	 * 사용한 Mapper : AdminMapper -> selectProductListCountWithFiltering -> bookGenre, bookCnt를 받아서 해당하는 데이터의 개수를 뽑아옴		
	 * 			   : AdminMapper -> selectProductListWithFiltering -> bookGenre, bookCnt, bookSortSequenceOption, bookSortOption, startRow, endRow를 받아서 해당하는 데이터를 받아옴
	 * 반환되는 위치 : admin_dashboardFilteringList.js
	 */
	@RequestMapping(value = "/admin/selectProductListWithFiltering.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public Map selectProductListWithFiltering(HttpSession session,
			@RequestParam(defaultValue = "default") String bookSortOption,
			@RequestParam(defaultValue = "default") String bookSortSequenceOption,
			@RequestParam(defaultValue = "1") int curPage, @RequestParam(defaultValue = "100") int bookCnt,
			@RequestParam(defaultValue = "default") String bookGenre) {
		Map result = new HashMap();

		Map searchMap1 = new HashMap();
		Map searchMap2 = new HashMap();

		if (!bookGenre.equals("default")) {
			searchMap1.put("bookGenre", bookGenre);
			searchMap2.put("bookGenre", bookGenre);
		}
		if (!bookSortOption.equals("default")) {
			searchMap2.put("bookSortSequenceOption", bookSortSequenceOption);
			searchMap2.put("bookSortOption", bookSortOption);
		}
		searchMap1.put("bookCnt", bookCnt);
		searchMap2.put("bookCnt", bookCnt);
		int listCnt = adminService.selectProductListCountWithFiltering(searchMap1);

		PaginationVO paginationVO = new PaginationVO(listCnt, curPage);

		searchMap2.put("startRow", paginationVO.getStartIndex());
		searchMap2.put("endRow", paginationVO.getStartIndex() + paginationVO.getPageSize());

		List<BookVO> bookList = adminService.selectProductListWithFiltering(searchMap2);
		result.put("pagination", paginationVO);
		result.put("bookList", bookList);
		result.put("bookListSize", bookList.size());

		return result;
	}
}
