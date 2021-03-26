<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no" />
  <title>Drag/Drop/Bounce</title>
		<style>
            #DivDragDrop 
            {
              width:100%;
              height:500px;
              display: flex;
              align-items: center;
              justify-content: center;
              overflow: hidden;
              touch-action: none;
              background-color:gray;
            }
            #DivData 
            {
              touch-action: none;
              user-select: none;
              background-color:red;
              border:2px solid yellow;
              width:320px;
              height:60%;
            }
            #DivData:active 
            {
              background-color: rgba(168, 218, 220, 1.00);
            }
            #DivData:hover 
            {
              cursor: pointer;
            }
        </style>
</head>

<body>

    <main>
            <div id="DivDragDrop">
				<div id="DivData" style="position:absolute; left:0px; right:0px; margin-left:auto; margin-right:auto; top:105px;max-width:340px;">
                <!--<div id="DivData" style="max-width:340px;">-->
					<table align="center" border="0" id="TabData" style="max-width:310px;">
						<thead style="cursor:move;" id="DivDataHeader">
							<tr>
								<td align="center" valign="center"  colspan="3">
									<img  style="display:inline-block; width:50px;height:30px;float:left;padding-left:2px;cursor:pointer;" src="Images/Save.png" title="Sauvegarder" onclick="javascript:Save();"/>
									<img  style="display:inline-block; width:50px;height:30px;float:left;padding-left:5px;cursor:pointer;" src="Images/Comptes.png" title="Comptes associ&eacute;s" onclick="javascript:Comptes();"/>
									<span style="display:inline-block; border:0px solid yellow; margin-top:3px;">Compte Principal</span>
									<img  style="display:inline-block; width:30px;height:30px;float:right;padding-right:2px;cursor:pointer;" src="Images/Fermer.png" title="Fermer" onclick="javascript:FermerData();"/>
								</td>
							</tr>
						</thead>
						<tbody id="TabDataBody"><tr><td>BODY</td></tr></tbody>
						<tfoot><tr><td align="center" valign="center" colspan="3">FOOTER</td></tr></tfoot>
					</table>
				</div>				
			</div>
        </main>




<script lang="javascript">
    var container = document.querySelector("#DivDragDrop");
    var dragItem = document.querySelector("#DivData");
    

    var active = false;
    var currentX;
    var currentY;
    var initialX;
    var initialY;
    var xOffset = 0;
    var yOffset = 0;

    container.addEventListener("touchstart", dragStart, false);
    container.addEventListener("touchend", dragEnd, false);
    container.addEventListener("touchmove", drag, false);

    container.addEventListener("mousedown", dragStart, false);
    container.addEventListener("mouseup", dragEnd, false);
    container.addEventListener("mousemove", drag, false);

    function dragStart(e) 
    {
        if (e.type === "touchstart") 
        {
            initialX = e.touches[0].clientX - xOffset;
            initialY = e.touches[0].clientY - yOffset;
        } 
        else 
        {
            initialX = e.clientX - xOffset;
            initialY = e.clientY - yOffset;
        }

        if (e.target === dragItem) 
        {
            active = true;
        }
    }

    function dragEnd(e) 
    {
        initialX = currentX;
        initialY = currentY;

        active = false;
    }

    function drag(e) 
    {
        if (active) 
        {
            e.preventDefault();
      
            if (e.type === "touchmove") 
            {
                currentX = e.touches[0].clientX - initialX;
                currentY = e.touches[0].clientY - initialY;
            }   
            else 
            {
                currentX = e.clientX - initialX;
                currentY = e.clientY - initialY;
            }

            xOffset = currentX;
            yOffset = currentY;

            setTranslate(currentX, currentY, dragItem);
        }
    }

    function setTranslate(xPos, yPos, el) 
    {
        el.style.transform = "translate3d(" + xPos + "px, " + yPos + "px, 0)";
    }
</script>
</body>

</html>