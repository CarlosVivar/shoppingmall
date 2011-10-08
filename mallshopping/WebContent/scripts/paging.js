var pagenum;
var trangcuoi;
var trangdau = false;
var xetkhong = false;
function Pager(tableName, itemsPerPage) {
    this.tableName = tableName;
    this.itemsPerPage = itemsPerPage;
    this.currentPage = 1;
    this.pages = 0;
    this.inited = false;
    
    this.showRecords = function(from, to) {        
        var rows = document.getElementById(tableName).rows;
        // i starts from 1 to skip table header row
        for (var i = 1; i < rows.length; i++) {
            if (i < from || i > to)  
                rows[i].style.display = 'none';
            else
                rows[i].style.display = '';
        }
    }
    
    this.showPage = function(pageNumber) {
    	if (! this.inited) {
    		alert("not inited");
    		return;
    	}
        var oldPageAnchor;
        if(trangdau == false && xetkhong == false)
        {
            oldPageAnchor = document.getElementById('pg'+this.currentPage);
            oldPageAnchor.className = 'pg-normal';
        }
        
        if (xetkhong == false) {
            this.currentPage = pageNumber;
            var newPageAnchor = document.getElementById('pg'+this.currentPage);
            newPageAnchor.className = 'pg-selected';
        
            var from = (pageNumber - 1) * itemsPerPage + 1;
            var to = from + itemsPerPage - 1;
            this.showRecords(from, to);
            pagenum = pageNumber;
        }
        
    }   
    
    
    this.prev = function() {
        
        var element = document.getElementById("pageNavPosition");
    	var pagerHtml = "";
        for (var page = 1; page <= this.pages; page++) 
            pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="pager.showPage(' + page + '); call(' + page + ');">' + page + '</span>  ';      
        pagerHtml += '<span class="pg-normal" onclick="pager.next();call('+ trangcuoi +');">' + 'Cuối </span>';    
        element.innerHTML = pagerHtml;
        pagenum = 1;
        this.showPage(1); 
    }
    
    this.next = function() {
        
        var element = document.getElementById("pageNavPosition");
    	var pagerHtml = '<span class="pg-normal" style="margin : 5px;" onclick="pager.prev(); call('+ 1 +');">' + ' Đầu </span>';
        for (var page = 2 ; page <= this.pages; page++) 
            pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="pager.showPage(' + page + '); call('+ page +');">' + page + '</span>  ';      
        element.innerHTML = pagerHtml;
        if (this.currentPage == 1) {
            this.currentPage = trangcuoi;
             var newPageAnchor = document.getElementById('pg'+this.currentPage);
             newPageAnchor.className = 'pg-selected';
        
            var from = (trangcuoi - 1) * itemsPerPage + 1;
            var to = from + itemsPerPage - 1;
            this.showRecords(from, to);
            pagenum = trangcuoi;
        }
        else
        {
            this.showPage(trangcuoi);
            pagenum = trangcuoi;
        }
         
    }                        
    
    this.init = function() {
        var rows = document.getElementById(tableName).rows;
        var records = (rows.length - 1); 
        this.pages = Math.ceil(records / itemsPerPage);
        this.inited = true;
    }
    
    this.showPageNav = function(pagerName, positionId) {
    	if (! this.inited) {
    		alert("not inited");
    		return;
    	}
    	var element = document.getElementById(positionId);
    	
    	var pagerHtml = "";
        for (var page = 1; page <= this.pages; page++)
        {
            trangcuoi = this.pages; 
            pagerHtml += '<span id="pg' + page + '" class="pg-normal" onclick="' + pagerName + '.showPage(' + page + '); call(' + page+ ')">' + page + '</span>  ';
        }
        if (this.pages == 0) {
            xetkhong = true;
        }
        else
        {
            if(this.pages == 1)
            {
                trangdau = true;
            }
            else
            {
                pagerHtml += '<span onclick="'+pagerName+'.next(); call('+ trangcuoi +');" class="pg-normal">' + 'Cuối </span>';            
            }            
        }
        
        
        
        element.innerHTML = pagerHtml;
    }
}

