package yolo.vo;

public class PagingVO {
	
	//한페이지당 게시글 수
	private int pageSize =10;
	
	//한 블럭당 페이지 수
	private int rangeSize = 5;
	
	//현재 페이지
	private int curPage = 1;
	
	//현재 블럭
	private int curRange = 1;
	
	//총 게시글 수 
	private int listCnt;
	
	//총 페이지 수 
	private int pageCnt;
	
	//총 블럭 수 
	private int rangeCnt;
	
	//시작 페이지
	private int startPage =1;
	
	//끝 페이지
	private int endPage = 1;
	
	//시작 index
	private int startIndex = 0;
	
	//이전 페이지
	private int prevPage;
	
	//다음 페이지
	private int nextPage;

	
	public PagingVO(int listCnt, int curPage) {
		/** 현재페이지 **/
        setCurPage(curPage);
        /** 총 게시물 수 **/
        setListCnt(listCnt);
        
        /** 1. 총 페이지 수 **/
        setPageCnt(listCnt);
        /** 2. 총 블럭(range)수 **/
        setRangeCnt(pageCnt);
        /** 3. 블럭(range) setting **/
        rangeSetting(curPage);
        
        /** DB 질의를 위한 startIndex 설정 **/
        setStartIndex(curPage);
        
	}
	
	public void setPageCnt(int listCnt) {
		 this.pageCnt = (int) Math.ceil(listCnt*1.0/pageSize);
    }
    public void setRangeCnt(int pageCnt) {
        this.rangeCnt = (int) Math.ceil(pageCnt*1.0/rangeSize);
    }
    public void rangeSetting(int curPage){
        
        setCurRange(curPage);        
        this.startPage = (curRange - 1) * rangeSize + 1;
        this.endPage = startPage + rangeSize - 1;
        
        if(endPage > pageCnt){
            this.endPage = pageCnt;
        }
        
        this.prevPage = curPage - 1;
        this.nextPage = curPage + 1;
    }
    public void setCurRange(int curPage) {
        this.curRange = (int)((curPage-1)/rangeSize) + 1;
    }
    public void setStartIndex(int curPage) {
        this.startIndex = (curPage-1) * pageSize;
    }
    
	
	//getter, setter


	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getRangeSize() {
		return rangeSize;
	}

	public void setRangeSize(int rangeSize) {
		this.rangeSize = rangeSize;
	}

	public int getCurPage() {
		return curPage;
	}

	public void setCurPage(int curPage) {
		this.curPage = curPage;
	}

	public int getListCnt() {
		return listCnt;
	}

	public void setListCnt(int listCnt) {
		this.listCnt = listCnt;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public int getPrevPage() {
		return prevPage;
	}

	public void setPrevPage(int prevPage) {
		this.prevPage = prevPage;
	}

	public int getNextPage() {
		return nextPage;
	}

	public void setNextPage(int nextPage) {
		this.nextPage = nextPage;
	}

	public int getCurRange() {
		return curRange;
	}

	public int getPageCnt() {
		return pageCnt;
	}

	public int getRangeCnt() {
		return rangeCnt;
	}

	public int getStartIndex() {
		return startIndex;
	}

	@Override
	public String toString() {
		return "PagingVO [pageSize=" + pageSize + ", rangeSize=" + rangeSize + ", curPage=" + curPage + ", curRange="
				+ curRange + ", listCnt=" + listCnt + ", pageCnt=" + pageCnt + ", rangeCnt=" + rangeCnt + ", startPage="
				+ startPage + ", endPage=" + endPage + ", startIndex=" + startIndex + ", prevPage=" + prevPage
				+ ", nextPage=" + nextPage + "]";
	}
	

	

}


