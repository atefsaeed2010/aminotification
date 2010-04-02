Attribute VB_Name = "Tray"
'* Copyright (c) 2010 ����Ȩ���������С�����Ȩ�˱���һ��Ȩ����
'*
'* �����Ȩ�����ʹ���߷��������������������£�����ʹ����ʹ�ü���ɢ����
'* �����װԭʼ�뼰����λ��ִ����ʽ��Ȩ�������۴˰�װ�Ƿ񾭸�����Ȼ��
'*
'* * ���ڱ����Դ�������ɢ�������뱣�������İ�Ȩ���桢�����������У���
'*   ������������������
'* * ���ڱ��׼�����λ��ִ����ʽ����ɢ���������������ļ��Լ�������������
'*   ��ɢ����װ�е�ý�鷽ʽ����������֮��Ȩ���桢�����������У��Լ�����
'*   ������������
'* * δ����ǰȡ��������ɣ�����ʹ�����λ����������֮���ƣ�
'*   ��Ϊ�����֮���������κα�ʾ֧�֡��Ͽɻ��ƹ㡢����֮��Ϊ��
'*
'* ����������������������μ������֮����������״��"as is"���ṩ�������
'* ��װ�����κ���ʾ��Ĭʾ֮�������Σ������������ھ��������Լ��ض�Ŀ�ĵ�
'* ������ΪĬʾ�Ե��������μ������֮�����ߣ������κ����������۳������
'* ���������塢���۴�����Ϊ���Լ��ϵ���޹�ʧ������������ΥԼ֮��Ȩ
'* ��������ʧ������ԭ��ȣ����𣬶����κ���ʹ�ñ������װ���������κ�ֱ
'* ���ԡ�����ԡ�ż���ԡ������ԡ��ͷ��Ի��κν�����𺦣���������������
'* ����Ʒ������֮���á�ʹ����ʧ��������ʧ��������ʧ��ҵ���жϵȵȣ�����
'* ���κ����Σ����ڸ���ʹ���ѻ���ǰ��֪���ܻ���ɴ����𺦵���������Ȼ��

'* Copyright (c) 2010, ZhangXin. All rights reserved.
'*
'* Redistribution and use in source and binary forms, with or without
'* modification, are permitted provided that the following conditions are met:
'*
'*     * Redistributions of source code must retain the above copyright
'*       notice, this list of conditions and the following disclaimer.
'*     * Redistributions in binary form must reproduce the above copyright
'*       notice, this list of conditions and the following disclaimer in the
'*       documentation and/or other materials provided with the distribution.
'*     * Neither the name of the ZhangXin nor the names of its contributors
'*       may be used to endorse or promote products derived from this software
'*       without specific prior written permission.
'*
'* THIS SOFTWARE IS PROVIDED BY ZHANGXIN AND CONTRIBUTORS "AS IS" AND ANY
'* EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
'* WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
'* DISCLAIMED. IN NO EVENT SHALL ZHANGXIN AND CONTRIBUTORS BE LIABLE FOR ANY
'* DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
'* (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
'* LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
'* ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
'* (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
'* SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.



Option Explicit

'ʹ�ø߷ֱ���ͼ�����õ�API
Private Declare Function LoadImage Lib "user32" Alias "LoadImageA" (ByVal hInst As Long, ByVal lpsz As String, ByVal dwImageType As Long, ByVal dwDesiredWidth As Long, ByVal dwDesiredHeight As Long, ByVal dwFlags As Long) As Long
Private Const LR_LOADFROMFILE = &H10
Private Const LR_LOADMAP3DCOLORS = &H1000
Private Const IMAGE_ICON = 1
'ϵͳ����
Private Declare Function Shell_NotifyIcon Lib "shell32.dll" Alias "Shell_NotifyIconA" (ByVal dwMessage As Long, lpData As NOTIFYICONDATA) As Long
Private Const NIF_MESSAGE = &H1
Private Const NIF_ICON = &H2
Private Const NIF_TIP = &H4
Private Const NIF_STATE = &H8
Private Const NIF_INFO = &H10
Private Const NIM_ADD = &H0
Private Const NIM_MODIFY = &H1
Private Const NIM_DELETE = &H2
Private Const NIM_SETFOCUS = &H3
Private Const NIM_SETVERSION = &H4
Private Const NIM_VERSION = &H5
Private Const WM_USER As Long = &H400
Private Const NIN_BALLOONSHOW = (WM_USER + 2)
Private Const NIN_BALLOONHIDE = (WM_USER + 3)
Private Const NIN_BALLOONTIMEOUT = (WM_USER + 4)
Private Const NIN_BALLOONUSERCLICK = (WM_USER + 5)
Private Const NOTIFYICON_VERSION = 3
Private Const NIS_HIDDEN = &H1
Private Const NIS_SHAREDICON = &H2
Private Const WM_NOTIFY As Long = &H4E
Private Const WM_COMMAND As Long = &H111
Private Const WM_CLOSE As Long = &H10
Private Const WM_MOUSEMOVE As Long = &H200
Private Const WM_LBUTTONDOWN As Long = &H201
Private Const WM_LBUTTONUP As Long = &H202
Private Const WM_LBUTTONDBLCLK As Long = &H203
Private Const WM_MBUTTONDOWN As Long = &H207
Private Const WM_MBUTTONUP As Long = &H208
Private Const WM_MBUTTONDBLCLK As Long = &H209
Private Const WM_RBUTTONDOWN As Long = &H204
Private Const WM_RBUTTONUP As Long = &H205
Private Const WM_RBUTTONDBLCLK As Long = &H206

Public Enum bFlag
    NIIF_NONE = &H0
    NIIF_INFO = &H1
    NIIF_WARNING = &H2
    NIIF_ERROR = &H3
    NIIF_GUID = &H5
    NIIF_ICON_MASK = &HF
    NIIF_NOSOUND = &H10 '�ر���ʾ����־
End Enum

Private Type NOTIFYICONDATA
    cbSize As Long
    hwnd As Long
    uID As Long
    uFlags As Long
    uCallbackMessage As Long
    hIcon As Long
    szTip As String * 128
    dwState As Long
    dwStateMask As Long
    szInfo As String * 256
    uTimeoutAndVersion As Long
    szInfoTitle As String * 64
    dwInfoFlags As Long
End Type

'����¼�
Public Enum TrayRetunEventEnum
    MouseMove = &H200
    LeftUp = &H202
    LeftDown = &H201
    LeftDbClick = &H203
    RightUp = &H205
    RightDown = &H204
    RightDbClick = &H206
    MiddleUp = &H208
    MiddleDown = &H207
    MiddleDbClick = &H209
    BalloonClick = (WM_USER + 5)
End Enum

Public ni As NOTIFYICONDATA
Public Sub TrayAddIcon(ByVal MyForm As Form, ByVal MyIcon As String, ByVal ToolTip As String, Optional ByVal bFlag As bFlag)

    With ni
        .cbSize = Len(ni)
        .hwnd = MyForm.hwnd
        .uID = vbNull
        .uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
        .uCallbackMessage = WM_MOUSEMOVE
        .hIcon = LoadImage(App.hInstance, MyIcon, IMAGE_ICON, 16, 16, LR_LOADFROMFILE Or LR_LOADMAP3DCOLORS)
        .szTip = ToolTip & vbNullChar
    End With
    
    Call Shell_NotifyIcon(NIM_ADD, ni)

End Sub

Public Sub TrayRemoveIcon()

    Shell_NotifyIcon NIM_DELETE, ni
    
End Sub

Public Sub TrayBalloon(ByVal MyForm As Form, ByVal sBaloonText As String, sBallonTitle As String, Optional ByVal bFlag As bFlag)

    With ni
        .cbSize = Len(ni)
        .hwnd = MyForm.hwnd
        .uID = vbNull
        .uFlags = NIF_INFO
        .dwInfoFlags = bFlag
        .szInfoTitle = sBallonTitle & vbNullChar
        .szInfo = sBaloonText & vbNullChar
    End With

    Shell_NotifyIcon NIM_MODIFY, ni

End Sub

Public Sub TrayTip(ByVal MyForm As Form, ByVal sTipText As String)

    With ni
        .cbSize = Len(ni)
        .hwnd = MyForm.hwnd
        .uID = vbNull
        .uFlags = NIF_ICON Or NIF_TIP Or NIF_MESSAGE
        .szTip = sTipText & vbNullChar
    End With

    Shell_NotifyIcon NIM_MODIFY, ni

End Sub

