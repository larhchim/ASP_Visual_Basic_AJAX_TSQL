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
			document.getElementById('TabScrollBody').innerHTML = T[1];
			document.getElementById('TabScrollBody').style.visibility = 'visible';
		}
	}

	xmlhttp.open("GET", fichier, true);
	xmlhttp.send();
}

function Rechercher() {
	var crt, val, fichier;
	ann = document.getElementById('TVal').value;
	fichier = 'GestionBudgetAjaxListe.asp?ann=' + ann;
	document.getElementById('DivData').style.visibility = 'hidden';
	AjaxGetListe(fichier);
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
			document.getElementById('TabDataBody').innerHTML = xmlhttp.responseText;
			document.getElementById('TabScrollBody').style.visibility = 'hidden';
			document.getElementById('DivData').style.visibility = 'visible';
		}
	}

	xmlhttp.open("GET", fichier, true);
	xmlhttp.send();
}

function ChargerData(ann) {
	var cible = 'GestionBudgetAjaxGet.asp?ann=' + ann;
	AjaxGetData(cible);
}

function FermerData() {
	document.getElementById('DivData').style.visibility = 'hidden';
	document.getElementById('TabScrollBody').style.visibility = 'visible';
}
