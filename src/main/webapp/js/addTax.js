 $(function(){
	    	/** 员工表单提交 */
			$("#addTaxForm").submit(function(){
				var No = $("#No");
				var companyName = $("#companyName");
				var createDate = $("#createDate");
				var telephoneNumber1 = $("#telephoneNumber1");
				var goodsName = $("#goodsName");
				var count = $("#count");
				var taxMoney = $("#taxMoney");
				var sumMoney = $("#sumMoney");
				var msg = "";
			    if ($.trim(No.val()) == ""){
					msg = "No.不能为空！";
					No.focus();
				}
			    else if ($.trim(companyName.val()) == ""){
					msg = "购货单位不能为空！";
					companyName.focus();
				}else if ($.trim(createDate.val()) == ""){
					msg = "开票日期不能为空！";
					createDate.focus();
				}else if ($.trim(telephoneNumber1.val()) == ""){
					msg = "电话号码不能为空！";
					telephoneNumber1.focus();
				}else if ($.trim(goodsName.val()) == ""){
					msg = "货物名称不能为空！";
					goodsName.focus();
				}else if ($.trim(count.val()) == ""){
					msg = "数量不能为空！";
					count.focus();
				}else if ($.trim(sumMoney.val()) == ""){
					msg = "金额不能为空！";
					count.focus();
				}else if ($.trim(taxMoney.val()) == ""){
					msg = "税额不能为空！";
					taxMoney.focus();
				}
				if (msg != ""){
					$.ligerDialog.error(msg);
					return false;
				}else{
					return true;
				}
				$("#addTaxForm").submit();
			});
	    });