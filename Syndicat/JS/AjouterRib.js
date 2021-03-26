function AjaxGetListe(fichier) {
	var xmlhttp, T;

	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	}
	else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function () {
		if ((xmlhttp.readyState == 4) && (xmlhttp.status == 200)) {
			T = xmlhttp.responseText.split('##::##');
			document.getElementById('TabScroll').innerHTML = T[1];
			document.getElementById('TabScrollBody').style.visibility = 'visible';
		}
	}

	xmlhttp.open("GET", fichier, true);
	xmlhttp.send();
}

function Rechercher() {
	var app, ann, fichier;
	crit = document.getElementById('LCriteres').value;
	fichier = 'AjouterRibAjaxListe.asp?crit='+crit;
	document.getElementById('DivData').style.visibility = 'hidden';
	AjaxGetListe(fichier);
}

function Modify(){

	var bol = document.getElementById('LCriteres').value;
	var rib = document.getElementById('TRB').value;

	if( !(bol.localeCompare("coti")) ){


		var t = document.querySelectorAll('input[name=cotisation]:checked');

		var c = [];
		
		for (let i = 0; i < t.length; i++) {

			 c[i]=t[i].value;
			

		
			
		}

		var fichier = 'AjouterRibAjaxSet.asp?Tid='+c+'&rib='+rib+'&crit=coti';

		AjaxFunc(fichier);

	
	}



	if( !(bol.localeCompare("depe")) ){



		var t = document.querySelectorAll('input[name=depense]:checked');

		var c = [];

		
		for (let i = 0; i < t.length; i++) {

			c[i]=t[i].value;


		}

		var fichier = 'AjouterRibAjaxSet.asp?Tid='+c+'&rib='+rib+'&crit=depe';

		AjaxFunc(fichier);


		

	}
}

function AjaxFunc(fichier) {
	var xmlhttp, T;

	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	}
	else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function () {
		if ((xmlhttp.readyState == 4) && (xmlhttp.status == 200)) {
			T = xmlhttp.responseText.split('##::##');
			document.getElementById('TabScroll').innerHTML = T[1];
			document.getElementById('TabScroll').style.visibility = 'visible';
		}
	}

	xmlhttp.open("GET", fichier, true);
	xmlhttp.send();
}

function Valider() {
	var cod = (event.key || event.keyCode);

	if ((cod == 13) || (cod == 'Enter')) {
		Rechercher();
		return;
	}
}

function AjaxGetData(fichier) {
	var xmlhttp;

	if (window.XMLHttpRequest) {
		xmlhttp = new XMLHttpRequest();
	}
	else {
		xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xmlhttp.onreadystatechange = function () {
		if ((xmlhttp.readyState == 4) && (xmlhttp.status == 200)) {
			document.getElementById('TabData').innerHTML = xmlhttp.responseText;
			document.getElementById('TabScrollBody').style.visibility = 'hidden';
			document.getElementById('DivData').style.visibility = 'visible';
		}
	}

	xmlhttp.open("GET", fichier, true);
	xmlhttp.send();
}

function ChargerData(Id) {
	crit = document.getElementById('LCriteres').value;
	var cible = 'AjouterRibAjaxGet.asp?crit='+crit+'&Id=' + Id;
	AjaxGetData(cible);
}

function FermerData() {
	document.getElementById('DivData').style.visibility = 'hidden';
	document.getElementById('TabScrollBody').style.visibility = 'visible';
}
