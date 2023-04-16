console.log("review module..............");

var reviewService = (function(){

	function add(review, callback, error){
		console.log("add review...........");
		
		$.ajax({
			type: 'post',
			url: '/review/new',
			data : JSON.stringify(review),
			contentType : "application/json; charset=utf-8",
			success: function(result, status, xhr) {
				if(callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er){
				if(error) {
					error(er);
				}
			}
		})
	}
	
	function getList(param, callback, error) {
		var seq = param.seq;
		var page = param.page || 1;
		
		$.getJSON("/review/pages/" + seq + "/" + page + ".json",
			function(data) {
				if(callback) {
					  //callback(data);  //댓글 목록만 가져오는 경우
					callback(data.reviewCnt, data.list); //댓글 숫자와 목록을 가져오는 경우 
				}
			}).fail(function(xhr, status, err) {
				if(error) {
					error();
				}
			});
	}
	
	function remove(revSeq, callback, error) {
	
		$.ajax({
			type : 'delete',
			url : '/review/' + revSeq,
			success : function(deleteResult, status, xhr) {
				if(callback) {
					callback(deleteResult);
				}
			},
			error : function(xhr, status, er) {
				if(error) {
					error(er);
				}
			}
		});
	}
	
	function update(review, callback, error) {

		console.log("revSeq: " + review.revSeq);

		$.ajax({
			type : 'put',
			url : '/review/' + review.revSeq,
			data : JSON.stringify(review),
			contentType : "application/json; charset=utf-8",
			success : function(result, status, xhr) {
				if (callback) {
					callback(result);
				}
			},
			error : function(xhr, status, er) {
				if (error) {
					error(er);
				}
			}
		});
	}
	
	function get(revSeq, callback, error) {
	console.log("get review.........");
		$.get("/review/" + revSeq + ".json", function(result) {

			if (callback) {
				callback(result);
			}

		}).fail(function(xhr, status, err) {
			if (error) {
				error();
			}
		});
	}
	
	return {
	
	add:add,
	getList:getList,
	remove:remove,
	update:update,
	get:get
	};

})();