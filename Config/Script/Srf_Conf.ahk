﻿
#if srf_mode&&!GetKeyState("CapsLock", "T")&&not srf_all_input~="\d+"
;{{{ a-z定义
	a::
	b::
	c::
	d::
	e::
	f::
	g::
	h::
	i::
	j::
	k::
	l::
	m::
	n::
	o::
	p::
	q::
	r::
	s::
	t::
	u::
	v::
	w::
	x::
	y::
	z::
	srf_all_input .= A_ThisHotkey, waitnum:=select_sym:=0,num_for_select_arrays:=[], num__:="", localpos:=1
	gosub srf_tooltip_fanye
return

#if srf_mode&&!GetKeyState("CapsLock", "T")&&not srf_all_input~="\d+"&&srf_all_input~="^``"
	`::
	srf_all_input .= A_ThisHotkey, waitnum:=select_sym:=PosLimit:=0, num__:="", localpos:=1
	gosub srf_tooltip_fanye
return
#if

#if srf_mode&&!GetKeyState("CapsLock", "T")&&not srf_all_input~="\d+"&&srf_all_input~="^``[a-z]+"
	1::
		StrLen(srf_for_select_Array[1,1])>1?srf_select(1):Select_add(1)
	return
	2::Select_add(2)
	3::Select_add(3)
	4::Select_add(4)
	5::Select_add(5)
	6::Select_add(6)
	7::Select_add(7)
	8::Select_add(8)
	9::Select_add(9)
	0::Select_add(10)
	space::srf_select(1)
#if 

#If srf_mode&&InStr(srf_all_Input,"/")&&!GetKeyState("CapsLock", "T")&&not srf_all_input ~="[a-z]"
	1::
	2::
	3::
	4::
	5::
	6::
	7::
	8::
	9::
	0::
	.::
	Numpad1::
	Numpad2::
	Numpad3::
	Numpad4::
	Numpad5::
	Numpad6::
	Numpad7::
	Numpad8::
	Numpad9::
	Numpad0::
	NumpadDot::

	srf_all_input .= RegExReplace(A_ThisHotkey~="i)dot$"?".":A_ThisHotkey,"i)numpad"), select_sym:=0, localpos:=1
	gosub srf_tooltip_fanye
Return
#If

#if srf_mode&&!srf_all_input

	Numpad1::
	1::
		send {1}
		num__:=A_ThisHotkey
	Return
	Numpad2::
	2::
		send {2}
		num__:=A_ThisHotkey
	Return
	Numpad3::
	3::
		send {3}
		num__:=A_ThisHotkey
	Return
	Numpad4::
	4::
		send {4}
		num__:=A_ThisHotkey
	Return
	Numpad5::
	5::
		send {5}
		num__:=A_ThisHotkey
	Return
	Numpad6::
	6::
		send {6}
		num__:=A_ThisHotkey
	Return
	Numpad7::
	7::
		send {7}
		num__:=A_ThisHotkey
	Return
	Numpad8::
	8::
		send {8}
		num__:=A_ThisHotkey
	Return
	Numpad9::
	9::
		send {9}
		num__:=A_ThisHotkey
	Return
	Numpad0::
	0::
		send {0}
		num__:=A_ThisHotkey
	Return

	;快速多行注释
	^/::
		ClipSaved :=ClipboardAll
		sleep 300
		Clipboard :=""
		send ^x
		ClipWait
		send % "`n/*`n" Clipboard "`n */`n"
		Clipboard:=ClipSaved
		ClipSaved:=""
	Return

	`;::send % srf_symblos[";",symb_mode]
	,::send % srf_symblos[",",symb_mode]
	\::send % srf_symblos["\",symb_mode]
	[::send % srf_symblos["[",symb_mode]
	]::send % srf_symblos["]",symb_mode]
	-::send % srf_symblos["-",symb_mode]
	=::send % srf_symblos["=",symb_mode]
	+,::send % srf_symblos["<",symb_mode]
	+.::send % srf_symblos[">",symb_mode]
	+/::send % srf_symblos["?",symb_mode]
	+1::send % srf_symblos["!",symb_mode]
	+2::send % srf_symblos["@",symb_mode]
	+4::send % srf_symblos["$",symb_mode]
	+5::send % srf_symblos["%",symb_mode]
	+6::send % srf_symblos["^",symb_mode]
	+7::send % srf_symblos["&",symb_mode]
	+8::send % srf_symblos["*",symb_mode]
	+9::send % srf_symblos["(",symb_mode]
	+0::send % srf_symblos[")",symb_mode]
	+;::send % srf_symblos[":",symb_mode]
	+[::send % srf_symblos["{",symb_mode]
	+]::send % srf_symblos["}",symb_mode]
	'::
		if sym_match {
			srf_symblos["'",symb_mode]:=symb_mode=2?"‘’{Left}":srf_symblos["'",symb_mode]     ;引号光标并居中
			sym_qmarks:=0
		}else
			srf_symblos["'",symb_mode]:=symb_mode=2?(sym_qmarks?"’":"‘"):srf_symblos["'",symb_mode], sym_qmarks:=symb_mode=2?(sym_qmarks?0:1):0  ;引号智能左右匹配
		send % srf_symblos["'",symb_mode]
	return

	+'::
		if sym_match {
			srf_symblos["""",symb_mode]:=symb_mode=2?"“”{left}":srf_symblos["""",symb_mode]     ;双引号光标并居中
			sym_qmarks:=0
		}else
			srf_symblos["""",symb_mode]:=symb_mode=2?(sym_qmarks?"”":"“"):srf_symblos["""",symb_mode], sym_qmarks:=symb_mode=2?(sym_qmarks?0:1):0  ;单引号智能左右匹配
		send % srf_symblos["""",symb_mode]
	return

	.::
		if num__~="\d"
			send {.}
		else
			send % srf_symblos[".",symb_mode]
		num__:=""
	Return
	CapsLock::
		if !GetKeyState("CapsLock", "T"){
			SetCapsLockState , on
			GuiControl,3:, Pics,*Icon21 config\wubi98.icl
			gosub Get_IME
		}
		else
		{
			SetCapsLockState , off
			GuiControl,3:, Pics,*Icon9 config\wubi98.icl
			gosub Get_IME
		}
		gosub srf_value_off
	Return
	`::
		if !GetKeyState("CapsLock", "T"){
			srf_all_Input .= A_ThisHotkey, select_sym:=PosLimit:=0
			;[ ` ]引导常用符号自定义，Sym_Array多维数组首位置空，其它按顺序排列，增加的话 直接在数组里添加格式 >>  ,["符号"]
			global Sym_Array :=[[""],["·"],["～"],["☯"],["•"],["℃"],["〔〕{Left}"],["‰"],["℉"],["※"],["●"],["○"],["★"],["☆"],["©"],["√"],["×"],["№"],["％"],["≈"],["¿"],["¡"],[""],["ㄓ"]]
			gosub srf_tooltip_fanye
		}else{
			send % srf_symblos["``",symb_mode]
		}
	Return
	NumpadDiv::
	/::
		if !GetKeyState("CapsLock", "T"){
			if num__~="\d"{
				send {/}
				num__:=A_ThisHotkey
			}else{
				srf_all_Input .= A_ThisHotkey~="i)NumpadDiv"?"/":A_ThisHotkey, select_sym:=PosLimit:=0
				;[ / ]引导常用符号自定义，Sym_Array多维数组首位置空，其它按顺序排列，增加的话 直接在数组里添加格式 >>  ,["符号"]
				global Sym_Array_1 :=[[""],["？"],["、"]]
				gosub srf_tooltip_fanye
			}
		}else{
			send % srf_symblos["/",symb_mode]
		}
	Return
	~::
		if !GetKeyState("CapsLock", "T"){
			srf_all_Input .= A_ThisHotkey, select_sym:=PosLimit:=0
			gosub srf_tooltip_fanye 
		}else{
			send % srf_symblos["~",symb_mode]
		}
	Return
return
#if

#if !srf_mode&&!srf_all_input
	+'::
		if sym_match {
			send {"}{"}{left}
			sym_qmarks:=0
		}else
			send {"}
	return

	;快速多行注释
	^/::
		ClipSaved:=ClipboardAll
		Clipboard:=""
		send ^x
		send {/}{*}{`n 2}{*}{/}{up}
		send ^v
		Clipboard:=ClipSaved, ClipSaved:=""
	Return

	CapsLock::
		if GetKeyState("CapsLock", "T"){
			SetCapsLockState , off
			GuiControl,3:, Pics,*Icon12 config\wubi98.icl
			gosub Get_IME
		}
		else
		{
			SetCapsLockState , on
			GuiControl,3:, Pics,*Icon21 config\wubi98.icl
			gosub Get_IME
		}
		gosub srf_value_off
	Return
return
#if

FocusSelect1:
	If (A_ThisHotkey="Left"&&Textdirection~="i)horizontal"){
		If (localpos>1&&!(ListNum>5&&FontSize>18&&Cut_Mode~="on"&&srf_for_select_Array.Length()>5&&waitnum>0))
			localpos-=1
		else if (ListNum>5&&FontSize>18&&Cut_Mode~="on"&&srf_for_select_Array.Length()>5&&waitnum>0){
			Gosub LessWait
			localpos:=1
		}Else{
			if (waitnum*ListNum+localpos<srf_for_select_Array.Length()&&waitnum*ListNum+localpos<>1&&waitnum>0) {
				Gosub LessWait
				if (localpos=1)
					localpos:=ListNum
			}
		}
	} Else If (A_ThisHotkey="Right"&&localpos<ListNum&&Textdirection~="i)horizontal"&&waitnum*ListNum+localpos<srf_for_select_Array.Length()){
		if (ListNum>5&&FontSize>18&&Cut_Mode~="on"&&srf_for_select_Array.Length()>5&&waitnum+1<Ceil(srf_for_select_Array.Length()/ListNum)||srf_all_input~="\/\d+"&&Strlen(srf_all_input)>5&&waitnum+1<Ceil(srf_for_select_Array.Length()/ListNum)){
			Gosub MoreWait
			localpos:=1
		}else
			localpos+=1
	}else if (A_ThisHotkey="Left"&&Textdirection~="i)vertical"&&waitnum>0||A_ThisHotkey="Left"&&Textdirection~="i)horizontal"&&ListNum>5&&FontSize>18&&Cut_Mode~="on"&&srf_for_select_Array.Length()>5&&waitnum>0||A_ThisHotkey="Left"&&Textdirection~="i)horizontal"&&srf_all_input~="\/\d+"&&Strlen(srf_all_input)>5&&waitnum>0){
		Gosub LessWait
		localpos:=1
	}else if (A_ThisHotkey="Right"&&Textdirection~="i)vertical"&&waitnum+1<Ceil(srf_for_select_Array.Length()/ListNum)||A_ThisHotkey="Right"&&Textdirection~="i)horizontal"&&ListNum>5&&FontSize>18&&Cut_Mode~="on"&&srf_for_select_Array.Length()>5&&waitnum+1<Ceil(srf_for_select_Array.Length()/ListNum)||A_ThisHotkey="Right"&&Textdirection~="i)horizontal"&&srf_all_input~="\/\d+"&&Strlen(srf_all_input)>5&&waitnum+1<Ceil(srf_for_select_Array.Length()/ListNum)){
		Gosub MoreWait
		localpos:=1
	}Else{
		if (Textdirection~="i)horizontal"){
			if (localpos>ListNum-1&&waitnum*ListNum+localpos<srf_for_select_Array.Length()){
				Gosub MoreWait
				localpos:=1
			}
		}
	}
	If (ToolTipStyle~="i)gdip"&&FocusStyle)
		FocusGdipGui(srf_code, srf_for_select_obj, Caret.X, Caret.Y+30, FontType)
return

FocusSelect2:
	If (A_ThisHotkey="Up"&&Textdirection~="i)vertical"||A_ThisHotkey="Up"&&Textdirection~="i)horizontal"&&ListNum>5&&FontSize>18&&Cut_Mode~="on"&&srf_for_select_Array.Length()>5||A_ThisHotkey~="i)up"&&Textdirection~="i)horizontal"&&srf_all_input~="\/\d+"&&Strlen(srf_all_input)>5){
		If (localpos>1)
			localpos-=1
		Else{
			if (waitnum*ListNum+localpos<srf_for_select_Array.Length()&&waitnum*ListNum+localpos<>1&&waitnum>0) {
				Gosub LessWait
				if (localpos=1)
					localpos:=ListNum
			}
		}
	} Else If (localpos<ListNum&&Textdirection~="i)vertical"&&waitnum*ListNum+localpos<srf_for_select_Array.Length()||localpos<ListNum&&Textdirection~="i)horizontal"&&waitnum*ListNum+localpos<srf_for_select_Array.Length()&&ListNum>5&&FontSize>18&&Cut_Mode~="on"&&srf_for_select_Array.Length()>5||A_ThisHotkey="Down"&&Textdirection~="i)horizontal"&&srf_all_input~="\/\d+"&&Strlen(srf_all_input)>5&&waitnum*ListNum+localpos<srf_for_select_Array.Length()){
		localpos+=1
	}else if (A_ThisHotkey="Up"&&Textdirection~="i)horizontal"&&waitnum>0){
		Gosub LessWait
		localpos:=1
	}else if (A_ThisHotkey="Down"&&Textdirection~="i)horizontal"&&waitnum+1<Ceil(srf_for_select_Array.Length()/ListNum)){
		Gosub MoreWait
		localpos:=1
	}Else{
		if (Textdirection~="i)vertical"||localpos<ListNum&&Textdirection~="i)horizontal"&&waitnum*ListNum+localpos<srf_for_select_Array.Length()&&ListNum>5&&FontSize>18&&Cut_Mode~="on"&&srf_for_select_Array.Length()>5||Textdirection~="i)horizontal"&&srf_all_input~="\/\d+"&&Strlen(srf_all_input)>5&&waitnum*ListNum+localpos<srf_for_select_Array.Length()){
			if (localpos>ListNum-1&&waitnum*ListNum+localpos<srf_for_select_Array.Length()){
				Gosub MoreWait
				localpos:=1
			}
		}
	}
	If (ToolTipStyle~="i)gdip"&&FocusStyle)
		FocusGdipGui(srf_code, srf_for_select_obj, Caret.X, Caret.Y+30, FontType)
Return

#If srf_all_input&&srf_all_input~="\d+"
	space::
	`;::
	'::
	a::
	s::
	d::
	f::
	g::
	h::
	j::
	k::
	l::
	m::
	if InStr(Select_Code,A_ThisHotkey)>10
	{
		if A_ThisHotkey~="`;"
			srf_select(2)
		if A_ThisHotkey~="'"
			srf_select(3)
		if A_ThisHotkey~="i)space"
			srf_select(1)
	}else
		srf_select(InStr(Select_Code,A_ThisHotkey))
	Return

	Up::
	Down::
		gosub FocusSelect2
	Return

	Left::
	Right::
		gosub FocusSelect1
	return

#If

#if srf_all_input&&not srf_all_input~="\d+"

;快速选词快捷键
	Space::
	1::
		srf_select(ToolTipStyle~="i)gdip"&&FocusStyle?localpos:1)
	Return
	`;::
	2::
		srf_select(2)
	Return
	'::
	3::
		srf_select(3)
	Return
	4::srf_select(4)
	5::srf_select(5)
	6::srf_select(6)
	7::srf_select(7)
	8::srf_select(8)
	9::srf_select(9)
	0::srf_select(10)

;快速删词快捷键「Ctrl+Alt+{1-0}」
	^!1::
	^!Numpad1::
		Delete_Word(1)
	return

	^!2::
	^!Numpad2::
		Delete_Word(2)
	return

	^!3::
	^!Numpad3::
		Delete_Word(3)
	return

	^!4::
	^!Numpad4::
		Delete_Word(4)
	return

	^!5::
	^!Numpad5::
		Delete_Word(5)
	return

	^!6::
	^!Numpad6::
		Delete_Word(6)
	return

	^!7::
	^!Numpad7::
		Delete_Word(7)
	return

	^!8::
	^!Numpad8::
		Delete_Word(8)
	return

	^!9::
	^!Numpad9::
		Delete_Word(9)
	return

	^!0::
	^!Numpad0::
		Delete_Word(10)
	return

;快速置顶「Ctrl+{1-0}」
	^1::
	^Numpad1::
		set_top(1)
	return

	^2::
	^Numpad2::
		set_top(2)
	return

	^3::
	^Numpad3::
		set_top(3)
	return

	^4::
	^Numpad4::
		set_top(4)
	return

	^5::
	^Numpad5::
		set_top(5)
	return

	^6::
	^Numpad6::
		set_top(6)
	return

	^7::
	^Numpad7::
		set_top(7)
	return

	^8::
	^Numpad8::
		set_top(8)
	return

	^9::
	^Numpad9::
		set_top(9)
	return

	^0::
	^Numpad0::
		set_top(10)
	return

	Up::
	Down::
		gosub FocusSelect2
	Return

	Left::
	Right::
		gosub FocusSelect1
	return
#If

#if srf_all_input
	CapsLock::
		GetKeyState, CL_State, CapsLock, T
		if CL_State ~="U"{
			;sendinput % StringUpper(srf_all_input)    ;去掉行首分号启用按下CapsLock上屏大写英文
			Gosub srf_value_off
			srf_for_select_Array :=[]
			SetCapsLockState , on
			GuiControl,3:, Pics,*Icon21 config\wubi98.icl
			gosub Get_IME
		}else{
			GuiControl,3:, Pics,*Icon9 config\wubi98.icl
			gosub srf_value_off
		}
	Return

	PgUp::
	[::
	-::
		Gosub lessWait
	Return

	PgDn::
	]::
	=::
		Gosub MoreWait
	Return

	Esc::
		Gosub srf_value_off
		sym_qmarks:=0
	Return
	BackSpace::
		if (srf_all_input~="\``[a-z]"&&code_status&&select_arr.Length()>1&&srf_bianma[srf_bianma.Length()]=RegExReplace(srf_all_input,"^``")){
			Select_result:=RegExReplace(Select_result,select_value_arr[srfCounts] "$"),select_arr[1]:=Select_result?Select_result:"",srf_bianma.Pop()
			srfCounts:=srfCounts>1?srfCounts-1:1
		}else if (InStr(RegExReplace(srf_all_input,"^``"),"``")&&add_Result.Length()>1&&select_pos>1&&srf_all_input~=Split_code[select_pos] "$"){
			selectallvalue:=SubStr(selectallvalue,1,-1),add_Array[1]:=selectallvalue
			select_pos:=select_pos>1?select_pos-1:1
		}
		srf_all_Input:=SubStr(RegExReplace(srf_all_Input,"'",""), 1, -1), select_sym:=waitnum:=0
		If StrLen(srf_all_Input)<1
		{
			Gosub srf_value_off
		}Else{
			Gosub srf_tooltip_fanye
		}
	Return

	Enter::
	NumpadEnter::
		if Select_Enter~="send"
		{
			sendinput % RegExReplace(srf_all_input,"\'","")
			Gosub srf_value_off
		}
		else
		{
			Gosub srf_value_off
		}
	Return
#if

#if srf_mode&&srf_all_input&&srf_for_select_Array.Length()>0&&symb_send ~="on"
{
	+1::
		srf_select(1)
		send {！}
	Return
	+2::
		srf_select(1)
		send {@}
	Return
	+3::
		srf_select(1)
		send {#}
	Return
	+4::
		srf_select(1)
		send {$}
	Return

	+5::
		srf_select(1)
		send {`%}
	Return

	+6::
		srf_select(1)
		send {…}{…}
	Return
	+7::
		srf_select(1)
		send {&}
	Return
	+8::
		srf_select(1)
		send {*}
	Return
	+9::
		srf_select(1)
		send {（}
	Return
	+0::
		srf_select(1)
		send {）}
	Return
	+-::
		srf_select(1)
		send {—}{—}
	Return
	++::
		srf_select(1)
		send {+}
	Return
	+[::
		srf_select(1)
		send {「}
	Return
	+]::
		srf_select(1)
		send {」}
	Return
	+`;::
		srf_select(1)
		send {：}
	Return
	+'::
		srf_select(1)
		send {“}{”}{left}
	Return
	+,::
		srf_select(1)
		send {《}
	Return
	+.::
		srf_select(1)
		send {》}
	Return
	+/::
		srf_select(1)
		send {？}
	Return
	,::
		srf_select(1)
		send {，}
	Return
	.::
		srf_select(1)
		send {。}
	Return
	/::
		srf_select(1)
		send {、}
	Return
	[::
		srf_select(1)
		send {「}
	Return
	]::
		srf_select(1)
		send {」}
	Return
	+\::
		srf_select(1)
		send {·}
	Return
	\::
		srf_select(1)
		send {、}
	Return
	`::
		srf_select(1)
		send {-}{-}{-}{>}
	Return
}
#if

/*
;{{{ 脚本修改自动reload
#if WinActive("ahk_class i)Notepad") or WinActive("ahk_class i)EmEditor*") or WinActive("ahk_class i)Notepad*") or WinActive("ahk_class i)Chrome_WidgetWin*")
	~^s::
		WinGetTitle, title4, ahk_class i)Chrome_WidgetWin*
		WinGetTitle, title1, ahk_class i)EmEditor*
		WinGetTitle, title2, ahk_class i)Notepad*
		WinGetTitle, title3, ahk_class i)Notepad
		if (title1~="i)\.ahk"||title2~="i)\.ahk"||title3~="i)\.ahk"||title4~="i)\.ahk")
			Gosub OnReload
	return
#If
;}}}
*/

^esc::
	Gosub OnExit
return

/*
~LButton::
	If (A_Cursor ~= "i)IBeam" ){
		global tip_pos:={x:A_CaretX,y:A_CaretY+30}
		gosub Get_IME
		Gui, tips: Destroy
		gosub Get_IME
	}
Return
*/

~LButton::
	ToolTip(1, ""), ToolTip(2, "")
Return

vk5d::return ; 屏蔽键盘上的菜单右键
