<%
	Dim ParametreConnection, TailleImages, Entite, PhotosRep, DataBase, MailHost, TabCol(2)

	TabCol(0) = "#CC99CC"
	TabCol(1) = "#CC3333"
	TabCol(2) = "#FF9900"

	MailHost	= "mail.ens-sup.com"
	MailFrom	= "nabil@ens-sup.com"
	MailPass	= "FC-2013.ca"
	MailFromName= "Nabil"
    MailContact	= "mail.ens-sup.com"
	WebSite		= "www.mail.ens-sup.com"
	Entite		= "ENS-SUP"

''Server DataBase
	'DataBase	= Server.MapPath("..\") & "\Data\Ola.mdb"
	'PC		= "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" & DataBase
''Dev DataBase
	'DataBase	= "E:/Web/DataBase/Ola.mdb"
	'PC	        = "Provider=MSDASQL.1;Driver={Driver do Microsoft Access (*.mdb)};DBQ=" & DataBase
		
	Function DateFormate(dat)
		Dim j , m, a
		j = DatePart("d", dat)
		m = DatePart("m", dat)
		a = DatePart("yyyy", dat)
		If(len(j) = 1) Then
			j = "0" & j
		End If
		If(len(m) = 1) Then
			m = "0" & m
		End If
		DateFormate = j & "/" & m & "/" & a
	End Function
	
	function Selected(vala , valb)
		if (LCase(Cstr(vala)) = LCase(Cstr(valb))) then
			Selected = "selected"
		else
			Selected = ""
		end if
	end function

	function SelectedGrp(str , vala)
		dim nb, i, TabVal, val
		val = trim(vala)
		TabVal = split(str, ",")
		nb = UBOUND(TabVal)
		for i = 0 to nb
			if (Cstr(val) = Cstr(Trim(TabVal(i)))) then
				SelectedGrp = "selected"
				Exit Function
			end if
		next
		SelectedGrp = ""
	end function
	
	function IsChecked(val)
		if(val = True) then
			IsChecked = "checked"
		else
			IsChecked = ""
		end if
	end function

	function IsTrue(val)
		val = LCase(val)
		If((val = "true") or (val = "vrai") or (val = "1")) Then
			IsTrue = true
		Else
			IsTrue = false
		End If
	end function

	
	function AllTrim(str)
		dim str2
		str2 = Trim(str)
		while(Instr(str2,"  ")>0)
			str2 = replace(str2, "  ", " ",1)
		wend
		AllTrim = str2
	end function
	
	Function FormatText(str)
		str = replace(str, "'", "\'")
		str = replace(str, chr(10), "\n")
		str = replace(str, chr(13), "")
		str = replace(str, chr(34), "&#34;")
		str = replace(str, chr(92), "&#92;")
		FormatText = str
	End Function

	function FormatName(str)
		dim s1, s2
		s1 = Left(UCase(str),1)
		s2 = mid(LCase(str),2)
		FormatName = s1 & s2
	end function
%>
