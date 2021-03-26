var col1 = '#FFFFCC';  
var col2 = '#FFCCFF'; 

function FormatText(msg)
{
	var ch  = msg, car, cc, s = '', pos, taille = ch.length  ;

	for (pos = 0 ; pos < taille ; pos++)
	{
		car = ch.charAt(pos) ;
		cc  = ch.charCodeAt(pos) ;
		if (cc == 10)
			s = s + '<br>' ;
		else if (car == '<')
			s = s + '&lt;' ;
		else
			s = s +  car ;
	}
		
	return s ;
}

function IsAlias(str)
{ 
	var i, car, nbc = str.length ;
	str = str.toLowerCase() ;
				
	if(nbc == 0)
		return false ;
					
	for(i = 0 ; i < nbc ; i++)
	{
		car = str.charCodeAt(i) ;	
		if(((car != '-'.charCodeAt(0)) && (car != '.'.charCodeAt(0))  && (car < '0'.charCodeAt(0))) ||  ((car > '9'.charCodeAt(0)) && (car < 'a'.charCodeAt(0)) && (car != '_'.charCodeAt(0))) || (car > 'z'.charCodeAt(0))) 
		{
			return false ;
		}
	}
	return true ;
}
			
function IsDomaine(str)
{
	var i, car, nbc = str.length ;
	str = str.toLowerCase() ;
			
	if(nbc < 2)
		return false ;
 
	for(i = 0 ; i < nbc ; i++)
	{
		car = str.charCodeAt(i) ;	
		if(((car != '-'.charCodeAt(0)) && (car < '0'.charCodeAt(0))) ||  ((car > '9'.charCodeAt(0)) && (car < 'a'.charCodeAt(0))) || (car > 'z'.charCodeAt(0)) || (str.indexOf('--') != -1) || (str.indexOf('-') == 0)  || (str.lastIndexOf('-') == nbc-1)) 
		{
			return false ;
		}
	}
	return true ;	
}
 
function IsExt(str)
{
	var i, j, car, nbb, T ;
	str = str.toLowerCase() ;
	T = str.split('.') ;
	nbb = T.length ;
				
	if(nbb > 2)
		return false ;
					
	for(i = 0 ; i < nbb ; i++)
	{
		if(T[i].length < 2)
		{
			return false ;
		}
						
		for(j = 0 ; j < T[i].length ; j++)
		{
			car = T[i].charCodeAt(j) ;	
			if((car < 'a'.charCodeAt(0)) ||  (car > 'z'.charCodeAt(0)))
			{
				return false ;
			}
		}
	}
	return true ;
}
 
function IsEmail(email)
{
	var alias, domaine, sext, ext, pos1_a, pos2_a, pos1_p, pos2_p, pos3_p ;
	var nbc = email.length ;
				
	if(nbc < 7)
	{
		return false ;
	}		
	pos1_a = email.indexOf('@') ;
	pos2_a = email.lastIndexOf('@') ;
				
	if((pos1_a < 1) || (pos1_a != pos2_a))
	{
		return false ;
	}		
	if(!IsAlias(email.substring(0, pos1_a)))
	{
		return false ;
	}		
	pos1_p = email.indexOf('.', pos1_a +1) ;		
	if(pos1_p - pos1_a < 3)
	{
		return false ;
	}		
	if(!IsDomaine(email.substring(pos1_a +1, pos1_p)))
	{
		return false ;
	}		
	if(!IsExt(email.substr(pos1_p +1)))
	{
		return false ;
	}
	return true ;	
}

function IsPositifInt(str)
{
	var i, ls = str.length, car ;
	if(ls == 0)
		return false ;
		
	for(i = 0 ; i < ls ; i++)
	{
		car = str.charCodeAt(i) ;
		if((car < 48) || (car > 57))
		{
			return false ;
		}
	}
	return true ;
}

function IsTel(str)
{
	var i, ls = str.length, car ;
	if(ls == 0)
		return false ;
		
	for(i = 0 ; i < ls ; i++)
	{
		car = str.charCodeAt(i) ;
		if(((car < 48) && (car != 32)) || (car > 57))
		{
			return false ;
		}
	}
	return true ;
}

function AllTrim(str)
{
	while(str.indexOf('  ') != -1)
	{
		str = str.replace(/  /g, ' ') ;
	}
	if(str.indexOf(' ') == 0)
	{
		str = str.substr(1) ;
	}
	if(str.lastIndexOf(' ') == str.length-1)
	{
		str = str.substr(0, str.length-1) ;
	}
	return str ;
}

function Verif() 
{
    var Login = document.getElementById('TLogin');
    var Passwd = document.getElementById('TPasswd');
    var msg = '';
    if (Login.value.length < 4) 
    {
        msg = msg + '\n - Login';
        ChangeBackColor(Login, col1);
    }
    if (Passwd.value.length < 7) 
    {
        msg = msg + '\n - Mot de passe';
        ChangeBackColor(Passwd, col1);
    }
    if (msg.length > 0) 
    {
        msg = 'Veuillez saisir correctement le(s) champ(s) suivant(s) : \n' + msg;
        alert(msg);
        return;
    }
    document.getElementById('LoginForm').submit();
}

function Connexion(x) {
    var cod = (event.key || event.keyCode);

    if ((cod == 13) || (cod == 'Enter')) {
        if (x == 1) {
            document.getElementById('TPasswd').focus();
            return;
        }
        Verif();
    }
}

function VerifLogin() 
{
    var Login = document.getElementById('TLog_in');
    if (Login.value.length < 4) 
    {
        ChangeBackColor(Login, col1);
        alert('Veuillez saisir votre login');
        return;
    }
    document.getElementById('BTValider').disabled = true;
    document.getElementById('PassForm').submit();
}

function VerifPass(ope)
{
    var OldPass    = document.getElementById('TOldPass');
    var NewPass    = document.getElementById('TNewPass');
    var ConfPass   = document.getElementById('TConfPass');
    var msg = '';

    if (OldPass.value.length < 7) {
        msg = msg + '\n - L\'ancien mot de passe';
        ChangeBackColor(OldPass, col1);
    }
    if (NewPass.value.length < 7) {
        msg = msg + '\n - Le nouveau mot de passe';
        ChangeBackColor(NewPass, col1);
    }
    if (ConfPass.value.length < 7) {
        msg = msg + '\n - Le mot de passe de confirmation';
        ChangeBackColor(ConfPass, col1);
    }
    if (ConfPass.value !=  NewPass.value) {
        msg = msg + '\n - Le nouveau mot de passe est différent du mot de passe de confirmation';
        ChangeBackColor(ConfPass, col1);
        ChangeBackColor(NewPass, col1);
    }

    if (msg.length > 0) {
        msg = 'Veuillez saisir correctement le(s) champ(s) suivant(s) : \n' + msg;
        alert(msg);
        return;
    }
    document.getElementById('BTModifierInfos').disabled = true;
    document.getElementById('BTModifierPass').disabled = true;
    document.getElementById('TOpe').value = ope ;
    document.getElementById('CompteForm').submit();
}

function VerifInfos(ope) {
    var Email = document.getElementById('TEmail');
    var Tel = document.getElementById('TTel');
    var msg = '';

    Email.value = AllTrim(Email.value);
    Tel.value = AllTrim(Tel.value);
    if (!IsEmail(Email.value)) {
        msg = msg + '\n - Email';
        ChangeBackColor(Email, col1);
    }
    if (!IsTel(Tel.value)) {
        msg = msg + '\n - Téléphone';
        ChangeBackColor(Tel, col1);
    }
    if (msg.length > 0) {
        msg = 'Veuillez saisir correctement le(s) champ(s) suivant(s) : \n' + msg;
        alert(msg);
        return;
    }
    document.getElementById('BTModifierInfos').disabled = true;
    document.getElementById('BTModifierPass').disabled = true;
    document.getElementById('TOpe').value = ope;
    document.getElementById('CompteForm').submit();
}

function ChangeBackColor(obj, color)
{
    obj.style.backgroundColor = color;
}

function GetCaptcha(base)
{
    var TR;
    var head = document.head || document.getElementsByTagName('head')[0];
    var styleElem = document.createElement('style');
    styleElem.type = 'text/css';

    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    }
    else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xmlhttp.onreadystatechange = function () {
        if ((xmlhttp.readyState == 4) && (xmlhttp.status == 200)) {
            TR = xmlhttp.responseText.split('#*:*#');
            if (styleElem.styleSheet) {
                styleElem.styleSheet.cssText = TR[0];
            }
            else {
                styleElem.appendChild(document.createTextNode(TR[0]));
            }
            head.appendChild(styleElem);
            document.getElementById('TdCaptcha').innerHTML = 'Code de s&eacute;curit&eacute;' + TR[1];
            document.getElementById('TCaptcha').value = 'Code de sécurité';
            document.getElementById('TCaptcha').style.background = col1;
        }
    }
    xmlhttp.open("GET", base + "Captcha/GetCaptcha.asp", true);
    xmlhttp.send();
}

function VerifContact() {
    var Nom = document.getElementById('TNom');
    var Prenom = document.getElementById('TPrenom');
    var Email = document.getElementById('TEmail');
    var Tel = document.getElementById('TTel');
    var Message = document.getElementById('TMessage');
    var Captcha = document.getElementById('TCaptcha');
    var msg = '';

    Nom.value = AllTrim(Nom.value);
    Prenom.value = AllTrim(Prenom.value);
    Email.value = AllTrim(Email.value);
    Tel.value = AllTrim(Tel.value);
    Message.value = AllTrim(Message.value);

    if (Nom.value.length < 2) {
        msg = msg + '\n - Nom';
        ChangeBackColor(Nom, col1);
    }
    if (Prenom.value.length < 2) {
        msg = msg + '\n - Prénom';
        ChangeBackColor(Prenom, col1);
    }
    if (!IsEmail(Email.value)) {
        msg = msg + '\n - Email';
        ChangeBackColor(Email, col1);
    }
    if (!IsTel(Tel.value)) {
        msg = msg + '\n - Téléphone';
        ChangeBackColor(Tel, col1);
    }
    if (Message.value.length < 10) {
        msg = msg + '\n - Message';
        ChangeBackColor(Message, col1);
    }
    if (Captcha.value.length < 5) {
        msg = msg + '\n - Code de sécurité';
        ChangeBackColor(Captcha, col1);
    }
    if (msg.length > 0) {
        msg = 'Veuillez saisir correctement le(s) champ(s) suivant(s) : \n' + msg;
        alert(msg);
        return;
    }
    document.getElementById('TMsg').value = FormatText(Message.value);
    document.getElementById('BTValider').disabled = true;
    document.getElementById('ContactForm').submit(); 
}

//---------------------- Drag & Drop ----------------------

var active = false;
var currentX;
var currentY;
var initialX;
var initialY;
var xOffset = 0;
var yOffset = 0;
var Container;
var DragItem;

function InitDragDrop(IdContainer, IdDragItem) {
    Container = document.querySelector(IdContainer);
    DragItem = document.querySelector(IdDragItem);

    Container.addEventListener("touchstart", dragStart, false);
    Container.addEventListener("touchend", dragEnd, false);
    Container.addEventListener("touchmove", drag, false);

    Container.addEventListener("mousedown", dragStart, false);
    Container.addEventListener("mouseup", dragEnd, false);
    Container.addEventListener("mousemove", drag, false);
}

function dragStart(e) {
    if (e.type === "touchstart") {
        initialX = e.touches[0].clientX - xOffset;
        initialY = e.touches[0].clientY - yOffset;
    }
    else {
        initialX = e.clientX - xOffset;
        initialY = e.clientY - yOffset;
    }

    active = true;
}

function dragEnd(e) {
    initialX = currentX;
    initialY = currentY;

    active = false;
}

function drag(e) {
    if (active) {
        e.preventDefault();

        if (e.type === "touchmove") {
            currentX = e.touches[0].clientX - initialX;
            currentY = e.touches[0].clientY - initialY;
        }
        else {
            currentX = e.clientX - initialX;
            currentY = e.clientY - initialY;
        }

        xOffset = currentX;
        yOffset = currentY;

        setTranslate(currentX, currentY, DragItem);
    }
}

function setTranslate(xPos, yPos, el) {
    el.style.transform = 'translate3d(' + xPos + 'px, ' + yPos + 'px, 0)';
}