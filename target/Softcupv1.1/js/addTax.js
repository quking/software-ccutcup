 $(function(){
	    	/** Ա�����ύ */
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
					msg = "No.����Ϊ�գ�";
					No.focus();
				}
			    else if ($.trim(companyName.val()) == ""){
					msg = "������λ����Ϊ�գ�";
					companyName.focus();
				}else if ($.trim(createDate.val()) == ""){
					msg = "��Ʊ���ڲ���Ϊ�գ�";
					createDate.focus();
				}else if ($.trim(telephoneNumber1.val()) == ""){
					msg = "�绰���벻��Ϊ�գ�";
					telephoneNumber1.focus();
				}else if ($.trim(goodsName.val()) == ""){
					msg = "�������Ʋ���Ϊ�գ�";
					goodsName.focus();
				}else if ($.trim(count.val()) == ""){
					msg = "��������Ϊ�գ�";
					count.focus();
				}else if ($.trim(sumMoney.val()) == ""){
					msg = "����Ϊ�գ�";
					count.focus();
				}else if ($.trim(taxMoney.val()) == ""){
					msg = "˰���Ϊ�գ�";
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