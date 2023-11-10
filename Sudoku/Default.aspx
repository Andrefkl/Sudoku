<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Sudoku.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <script type="text/javascript">
    function numeric(evt) {
       var charCode = (evt.which) ? evt.which : event.keyCode
       if(charCode > 31 && ((charCode >= 48 && charCode <= 57) || charCode == 46))
        return true;
       else
        return false;
        }
        function TextBoxOnFocus(clicked_box)
        {
            var id = clicked_box.id;
            

            var character = id.replace(/^\D+/g, ''); // replace all leading non-digits with nothing
            var num = character / 9;
            
            var ClickedTop = Math.ceil(num);
            var ClickedBot = Math.floor(num);

            if (ClickedBot == num)
                ClickedBot -= 1;

            var clickedX = clicked_box.offsetLeft;
            var clickedY = clicked_box.offsetTop;
            for (var i = 1; i <= 81; i++)
            {
                var textBox = document.getElementById("TextBox" + i);
                var textBoxX = textBox.offsetLeft;
                var textBoxY = textBox.offsetTop;
                if (textBoxX == clickedX || textBoxY == clickedY) {
                    textBox.style.backgroundColor = "lightgray";
                }
                else if (clicked_box.value == textBox.value && textBox.value != "") {
                    textBox.style.backgroundColor = "darkgrey";
                }

                id = textBox.id;

                

                var boxcharacter = id.replace(/^\D+/g, ''); // replace all leading non-digits with nothing
                var boxnum = boxcharacter / 9;
                if (boxnum <= ClickedTop && boxnum > ClickedBot)
                    textBox.style.backgroundColor = "lightgray";
            }

            clicked_box.style.backgroundColor = "skyblue";
        }

        function TextBoxOnBlur()
        {
            for (var i = 1; i <= 81; i++) // Makes all textboxes white
            {
                var textBox = document.getElementById("TextBox" + i);
                textBox.style.backgroundColor = "white";
            }
        }
    </script>
    <style>
        
    </style>
</head>
<body>
    <style>
        .TextBox{
            width: 50px;
            height: 50px;
            font-size: 32px;
            text-align: center;
            background-color: white;
            border: 2px solid black;
        }

        .auto-style1 {
            position: absolute;
            left: 995px;
            top: 59px;
        }

        body {
            background-color: lightgray;
        }

        .gameBoard {
            margin-top: 10%;
            margin-left: 2%;
            padding: 0;
        }

        .gameTitle {
            position: absolute;
            font-size: 3rem;
            font-family: sans-serif;
            top: 7%;
            left: 12.5%;
        }
        .auto-style2 {
            position: absolute;
            left: 996px;
            top: 90px;
            width: 46px;
        }
        .auto-style3 {
            position: absolute;
            left: 1053px;
            top: 90px;
            width: 46px;
        }
        .auto-style4 {
            position: absolute;
            left: 1113px;
            top: 89px;
            width: 46px;
        }
        .NumbersCollection{
            margin-top: 3%;
            margin-left: 2%;
        }
        .Numbers{
            font-size: 72px;
            color: blue;
            padding:12px;
        }
        </style>
        
        <h1 class="gameTitle">Sudoku</h1>

    <form id="form1" runat="server" onclick="Form1_Click()">
        <asp:Label ID="LabelLives" runat="server" Text="Lives" CssClass="auto-style1"></asp:Label>
        <asp:Image ID="ImageHearts1" runat="server" CssClass="auto-style2" ImageUrl="~/Heart.png"/>
        <asp:Image ID="ImageHearts2" runat="server" CssClass="auto-style3" ImageUrl="~/Heart.png"/>
        <asp:Image ID="ImageHearts3" runat="server" CssClass="auto-style4" ImageUrl="~/Heart.png"/>
        <div class="gameBoard">
        <div>
            <asp:TextBox ID="TextBox1" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="11" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="12" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="13" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox10" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="14" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox11" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="15" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox12" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="16" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox19" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="17" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox20" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="18" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox21" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="19" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:Label ID="LabelInfo" runat="server" Text="LabelInfo"></asp:Label>            
        </div>
        <div>
            <asp:TextBox ID="TextBox4" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="21" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox5" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="22" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox6" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="23" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox13" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="24" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox14" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="25" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox15" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="26" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox22" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="27" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox23" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="28" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox24" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="29" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:Button ID="ButtonFillBoard" runat="server" OnClick="ButtonFillBoard_Click" Text="Fill The Board" />
        </div>
        <div>
            <asp:TextBox ID="TextBox7" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="31" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox8" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="32" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox9" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="33" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox16" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="34" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox17" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="35" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox18" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="36" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox25" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="37" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox26" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="38" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox27" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="39" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
        </div>
        <br />
        <div>
            <asp:TextBox ID="TextBox28" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="41" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox29" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="42" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox30" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="43" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox37" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="44" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox38" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="45" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox39" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="46" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox46" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="47" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox47" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="48" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox48" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="49" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBoxHideCount" runat="server" placeholder="Enter amount..." TextMode="Number"></asp:TextBox>
            <asp:Button ID="ButtonHideNumbers" runat="server" Text="Hide Numbers" OnClick="ButtonHideNumbers_Click" />
        </div>
        <div>
            <asp:TextBox ID="TextBox31" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="51" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox32" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="52" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox33" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="53" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox40" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="54" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox41" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="55" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox42" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="56" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox49" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="57" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox50" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="58" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox51" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="59" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
        </div>
        <div>
            <asp:TextBox ID="TextBox34" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="61" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox35" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="62" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox36" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="63" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox43" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="64" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox44" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="65" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox45" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="66" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox52" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="67" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox53" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="68" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox54" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="69" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:Button ID="ButtonEasy" runat="server" OnClick="ButtonEasy_Click" Text="Easy" />
            <asp:Button ID="ButtonMedium" runat="server" OnClick="ButtonMedium_Click" Text="Medium" />
            <asp:Button ID="ButtonHard" runat="server" OnClick="ButtonHard_Click" style="width: 41px" Text="Hard" />
        </div>
        <br />
        <div>
            <asp:TextBox ID="TextBox55" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="71" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox56" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="72" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox57" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="73" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox64" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="74" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox65" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="75" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox66" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="76" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox73" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="77" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox74" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="78" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox75" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="79" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
        </div>
        <div>
            <asp:TextBox ID="TextBox58" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="81" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox59" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="82" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox60" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="83" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox67" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="84" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox68" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="85" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox69" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="86" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox76" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="87" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox77" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="88" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox78" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="89" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
        </div>
        <div>
            <asp:TextBox ID="TextBox61" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="91" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox62" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="92" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox63" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="93" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox70" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="94" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox71" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="95" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox72" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="96" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            &nbsp;
            <asp:TextBox ID="TextBox79" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="97" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox80" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="98" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
            <asp:TextBox ID="TextBox81" runat="server" CssClass="TextBox" AutoPostBack="true" onkeyup="TextBox_KeyUp(this)" OnTextChanged="TextBox_TextChanged" onkeypress="return numeric(event)" MaxLength="1" onclick="TextBox_Input(this)" autocomplete="off" SkinID="99" onfocus="TextBoxOnFocus(this)" onblur="TextBoxOnBlur()"></asp:TextBox>
        </div>
        </div>

        <div class="NumbersCollection">
            <asp:Label ID="Label1" CssClass="Numbers" runat="server" Text="Label">1</asp:Label>
            <asp:Label ID="Label2" CssClass="Numbers" runat="server" Text="Label">2</asp:Label>
            <asp:Label ID="Label3" CssClass="Numbers" runat="server" Text="Label">3</asp:Label>
            <asp:Label ID="Label4" CssClass="Numbers" runat="server" Text="Label">4</asp:Label>
            <asp:Label ID="Label5" CssClass="Numbers" runat="server" Text="Label">5</asp:Label>
            <asp:Label ID="Label6" CssClass="Numbers" runat="server" Text="Label">6</asp:Label>
            <asp:Label ID="Label7" CssClass="Numbers" runat="server" Text="Label">7</asp:Label>
            <asp:Label ID="Label8" CssClass="Numbers" runat="server" Text="Label">8</asp:Label>
            <asp:Label ID="Label9" CssClass="Numbers" runat="server" Text="Label">9</asp:Label>
        </div>
    </form>
</body>
</html>
