VERSION 5.00
Object = "{248DD890-BB45-11CF-9ABC-0080C7E7B78D}#1.0#0"; "MSWINSCK.OCX"
Begin VB.Form notification 
   Appearance      =   0  'Flat
   BackColor       =   &H80000005&
   Caption         =   "AMI֪ͨ"
   ClientHeight    =   4980
   ClientLeft      =   8100
   ClientTop       =   4185
   ClientWidth     =   3585
   Icon            =   "notification.frx":0000
   LinkTopic       =   "Form1"
   MaxButton       =   0   'False
   ScaleHeight     =   4980
   ScaleWidth      =   3585
   Begin VB.Frame otherSetFrame 
      BackColor       =   &H80000004&
      Caption         =   "��������"
      Height          =   615
      Left            =   120
      TabIndex        =   17
      Top             =   3600
      Width           =   3375
      Begin VB.CheckBox BalloonCheck 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "������ʾ"
         ForeColor       =   &H80000008&
         Height          =   185
         Left            =   1800
         TabIndex        =   7
         Top             =   240
         Width           =   1335
      End
      Begin VB.CheckBox TrackCheck 
         Appearance      =   0  'Flat
         BackColor       =   &H80000005&
         Caption         =   "�򿪼�ؿ�"
         ForeColor       =   &H80000008&
         Height          =   180
         Left            =   240
         TabIndex        =   6
         Top             =   240
         Width           =   1335
      End
   End
   Begin VB.Frame PopSetFrame 
      BackColor       =   &H80000004&
      Caption         =   "��������"
      Height          =   1455
      Left            =   120
      TabIndex        =   15
      Top             =   2040
      Width           =   3375
      Begin VB.TextBox ExtenTXT 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   120
         TabIndex        =   5
         ToolTipText     =   "��Ҫ�������зֻ�����,����մ��ı���"
         Top             =   960
         Width           =   3135
      End
      Begin VB.TextBox PopAddrTXT 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   120
         TabIndex        =   4
         Text            =   "http://"
         ToolTipText     =   "�绰������%s��ʾ,������뽫�Զ��ӵ�ĩβ"
         Top             =   240
         Width           =   3135
      End
      Begin VB.Label Label5 
         AutoSize        =   -1  'True
         BackColor       =   &H80000004&
         Caption         =   "�ֻ�,����ֻ��ö��Ÿ���"
         Height          =   180
         Left            =   120
         TabIndex        =   16
         Top             =   720
         Width           =   2070
      End
   End
   Begin VB.Frame HostSetFrame 
      BackColor       =   &H80000004&
      Height          =   1815
      Left            =   120
      TabIndex        =   10
      Top             =   0
      Width           =   3375
      Begin VB.TextBox NameTXT 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   240
         TabIndex        =   2
         Top             =   960
         Width           =   2055
      End
      Begin VB.TextBox PortTXT 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   2400
         TabIndex        =   1
         Top             =   480
         Width           =   615
      End
      Begin VB.TextBox PswTXT 
         Appearance      =   0  'Flat
         Height          =   270
         IMEMode         =   3  'DISABLE
         Left            =   240
         PasswordChar    =   "*"
         TabIndex        =   3
         Top             =   1320
         Width           =   2055
      End
      Begin VB.TextBox HostTXT 
         Appearance      =   0  'Flat
         Height          =   270
         Left            =   240
         TabIndex        =   0
         Top             =   480
         Width           =   2055
      End
      Begin VB.Label Label4 
         AutoSize        =   -1  'True
         BackColor       =   &H80000004&
         Caption         =   "��¼��"
         Height          =   180
         Left            =   2400
         TabIndex        =   14
         Top             =   960
         Width           =   540
      End
      Begin VB.Label Label3 
         AutoSize        =   -1  'True
         BackColor       =   &H80000004&
         Caption         =   "����"
         Height          =   180
         Left            =   2400
         TabIndex        =   13
         Top             =   1320
         Width           =   360
      End
      Begin VB.Label Label2 
         AutoSize        =   -1  'True
         BackColor       =   &H80000004&
         Caption         =   "�˿�"
         Height          =   180
         Left            =   2400
         TabIndex        =   12
         Top             =   240
         Width           =   360
      End
      Begin VB.Label Label1 
         AutoSize        =   -1  'True
         BackColor       =   &H80000004&
         Caption         =   "��������ַ"
         Height          =   180
         Left            =   240
         TabIndex        =   11
         Top             =   240
         Width           =   900
      End
   End
   Begin VB.CommandButton loginCommand 
      Caption         =   "��¼"
      Height          =   375
      Left            =   1200
      TabIndex        =   8
      Top             =   4440
      Width           =   975
   End
   Begin VB.TextBox TrackTXT 
      Height          =   4695
      Left            =   3720
      MultiLine       =   -1  'True
      TabIndex        =   9
      Top             =   120
      Visible         =   0   'False
      Width           =   4455
   End
   Begin MSWinsockLib.Winsock WinsockClient 
      Left            =   120
      Top             =   240
      _ExtentX        =   741
      _ExtentY        =   741
      _Version        =   393216
   End
   Begin VB.Menu mSysPopup 
      Caption         =   "�˵�"
      Visible         =   0   'False
      Begin VB.Menu mShow 
         Caption         =   "��ʾ"
      End
      Begin VB.Menu mSep1 
         Caption         =   "-"
      End
      Begin VB.Menu mExit 
         Caption         =   "�˳�"
      End
   End
End
Attribute VB_Name = "notification"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
'''''''''''''''��δ��ɵĲ���:
'''''''''''''''1.һ���������򣬼������������ӵ�״̬
'''''''''''''''2.�Ľ���¼��ʽ��ʹ�ü��������¼��ʽ��
'''''''''''''''3.��������ܴ�����ע���
'''''''''''''''4.����ͼ������ɫ

Private Declare Function SetForegroundWindow Lib "user32" (ByVal hwnd As Long) As Long

Private Const sckClosed = 0             'ȱʡ�ġ��ر�
'Private Const sckOpen = 1               '��
'Private Const sckListening = 2          '����
'Private Const sckConnectionPending = 3  '���ӹ���
'Private Const sckResolvingHost = 4      'ʶ������
'Private Const sckHostResolved = 5       '��ʶ������
'Private Const sckConnecting = 6         '��������
Private Const sckConnected = 7           '������
'Private Const sckClosing = 8            'ͬ����Ա���ڹر�����
'Private Const sckError = 9              '����
Private Logined As Boolean
Dim LoginTXT As String

Dim WSHShell As Object ''''WScript.Shell���ڶ�дע���
Const regPath = "HKEY_LOCAL_MACHINE\SOFTWARE\AMI Notification\" 'д��ע����·��

Private Sub BalloonCheck_Click()
WriteReg BalloonCheck
End Sub

Private Sub ExtenTXT_Change()
ExtenTXT.Text = Trim(ExtenTXT.Text)
WriteReg ExtenTXT
End Sub


Private Sub Form_Load()
    '����ϵͳ����
    TrayAddIcon notification, App.Path & "\ico.ico", "���绰ʱ,�һẰŶ!"
    
    ''���һ��WScript.Shell
    Set WSHShell = CreateObject("WScript.Shell")
    Logined = False
    
    HostTXT.Text = ReadReg(HostTXT)
    PortTXT.Text = ReadReg(PortTXT)
    NameTXT.Text = ReadReg(NameTXT)
    PswTXT.Text = ReadReg(PswTXT)
    TrackCheck.Value = ReadReg(TrackCheck)
    BalloonCheck.Value = ReadReg(BalloonCheck)
    
    If ReadReg(PopAddrTXT) <> "" Then
        PopAddrTXT.Text = ReadReg(PopAddrTXT)
    Else
        PopAddrTXT.Text = "http://"
    End If
    ExtenTXT.Text = ReadReg(ExtenTXT)
    

End Sub


Private Sub Form_MouseMove(Button As Integer, Shift As Integer, x As Single, y As Single)
    
    '���ݵ���ʱ������¼�
    Dim Result As Long
    Dim cEvent As Single
    cEvent = x / Screen.TwipsPerPixelX

    Select Case cEvent

    Case MouseMove
        'Debug.Print "MouseMove"
    Case LeftUp
        Debug.Print "����ſ�"
    Case LeftDown
        Debug.Print "�������"
        notification.WindowState = 0
        notification.Show
    Case LeftDbClick
        Debug.Print "���˫��"
    Case MiddleUp
        Debug.Print "�м���ſ�"
    Case MiddleDown
        Debug.Print "�м������"
    Case MiddleDbClick
        Debug.Print "�м������"
    Case RightUp
        Debug.Print "�ҽ��ſ�"
    Case RightDown
        Debug.Print "�ҽ�����"
        '�������Ƴ�
        Result = SetForegroundWindow(Me.hwnd)
        '��ʱ��ʾ
        Me.PopupMenu Me.mSysPopup
    Case RightDbClick
        Debug.Print "�ҽ�˫��"
    Case BalloonClick
        Debug.Print "��������"

    End Select

End Sub


Private Sub Form_Resize()
If Me.WindowState = vbMinimized Then Me.Hide
End Sub

Private Sub Form_Unload(Cancel As Integer)
'Shell_NotifyIcon NIM_DELETE, Tray
TrayRemoveIcon
End Sub

Private Sub HostTXT_Change()
'HostTXT.Text = Trim(HostTXT.Text) 'ȥ�ո�
If ReadReg(HostTXT) <> HostTXT.Text Then
    WriteReg HostTXT
    
    WinsockClient.Close
    If WinsockClient.State = sckClosed Then
        Me.Caption = "AMI֪ͨ"
    End If
    WinsockClient.RemoteHost = HostTXT.Text
End If
End Sub

Private Sub PortTXT_Change()
PortTXT.Text = Trim(PortTXT.Text)
If ReadReg(PortTXT) <> PortTXT.Text Then
    WriteReg PortTXT

    WinsockClient.Close
    If WinsockClient.State = sckClosed Then
        Me.Caption = "AMI֪ͨ"
    End If
    If PortTXT.Text > 65535 Then
        PortTXT.Text = 65534
    End If
    If PortTXT.Text <> "" Then
        WinsockClient.RemotePort = PortTXT.Text
    End If
End If
End Sub


Private Sub NameTXT_Change()
If ReadReg(NameTXT) <> NameTXT.Text Then
    WriteReg NameTXT
End If
End Sub

Private Sub PopAddrTXT_Change()
If ReadReg(PopAddrTXT) <> PopAddrTXT.Text Then
    WriteReg PopAddrTXT
End If
End Sub


Private Sub loginCommand_Click()
    
    If WinsockClient.State = sckConnected Then
        WinsockClient.Close
        Logined = False
        WinsockClient_Closed
        Me.Caption = "AMI֪ͨ-�ѶϿ�"
        loginCommand.Caption = "��������"
    Else
        LoginTXT = "Action: login" & vbCrLf & "Username: " & NameTXT.Text & vbCrLf & "Secret: " & PswTXT.Text
        If HostTXT.Text <> "" And PortTXT.Text <> "" Then
            WinsockClient.Close
            WinsockClient.RemoteHost = HostTXT.Text
            WinsockClient.RemotePort = PortTXT.Text
            WinsockClient.Connect
        End If
    End If
End Sub

Private Sub loginCommand_GotFocus() '''''����ť�õ�����ʱ�����ɷ����õ��ı�logintxt����һ���Է�ֹ�û�������ı�

End Sub

Private Sub PortTXT_KeyPress(KeyAscii As Integer)
    Select Case KeyAscii
        Case 8 'backspace
            Exit Sub
        Case 48 To 57 '0-9
            Exit Sub
        Case Else
            KeyAscii = 0
            Beep
    End Select
End Sub

Private Sub PswTXT_Change()
WriteReg PswTXT
End Sub

Private Sub TrackCheck_Click()
    If TrackCheck.Value = 1 Then
        TrackTXT.Visible = True
        Me.Width = 8445
    ElseIf TrackCheck.Value = 0 Then
        TrackTXT.Visible = False
        Me.Width = 3705
    End If
    WriteReg TrackCheck
End Sub


Private Sub WinsockClient_Close()
WinsockClient_Closed
End Sub

Private Sub WinsockClient_Connect()
notification.Caption = "�ѷ��ַ�����"
WinsockClient.SendData (LoginTXT & vbCrLf & vbCrLf)
End Sub

Private Sub winsockclient_DataArrival(ByVal bytesTotal As Long)

    Dim arrival() As Byte, i As Long, s As String
    ReDim arrival(bytesTotal - 1) As Byte
    Dim arrivalStr As String
    'Dim ccc
    
    WinsockClient.GetData arrival, vbByte, bytesTotal
    For i = 0 To bytesTotal - 1
        arrivalStr = arrivalStr & Chr$(arrival(i))
        'Debug.Print i&; ":" & Chr$(arrival(i))
    Next
    If Logined = True Then
        PopDialEvent (arrivalStr)
    Else
        WaitLogin (arrivalStr)
        'trackTXT.Text = trackTXT.Text & arrivalStr ''''''''''''''''��trackTXT....�ŵ��������¼�ɹ�������ʾ����
    End If
        
    ''''''''�޶�trackTXT���ı���С
    If Len(TrackTXT.Text) > 300 Then
        TrackTXT.Text = ""
    End If
    TrackTXT.Text = TrackTXT.Text & arrivalStr
End Sub

Private Function PopDialEvent(Str As String) '���յ���string�������������з��ֶΣ��������Ƿ���
    Dim Events() As String
    Events = Split(Str, vbCrLf & vbCrLf)
    
    For i = 0 To UBound(Events)
        
        If FoundPopEvent(Events(i)) Then
            Popup (Events(i))
        End If
    Next
End Function

Private Function FoundPopEvent(Str As String) As Boolean 'ʹ����������Event,���ݾ����������###################################################
    'If InStr(str, "Event: Dial") And InStr(str, "Source: DAHDI") And InStr(str, "Destination: SIP") Then
    If Mid(Str, 1, 11) = "Event: Dial" And InStr(Str, "Source: ") And InStr(Str, "Destination: SIP") Then
        FoundPopEvent = True
    Else
        FoundPopEvent = False
    End If
End Function

Private Function Popup(Str As String)   'ʵʩ����
    Dim DestPhone, CallerID, PopAddrStr As String
    '''��ȡĿ�ĵ绰����
    StartNum = InStr(Str, "Destination: ")               '���ҵ���Destination: ��
    StartNum = InStr(StartNum, Str, "/") + 1             '���Ҵ����еġ�/��
    StopNum = InStr(StartNum, Str, "-")   '�ҵ���һ���еġ�-��
    DestPhone = Mid(Str, StartNum, StopNum - StartNum)   '��ȡ��/����-���м�Ĳ���
    '''''''��ȡcallerid
    StartNum = InStr(Str, "CallerID: ") + 10
    StopNum = InStr(StartNum, Str, vbCrLf)
    CallerID = Mid(Str, StartNum, StopNum - StartNum)
    
    If InStr(PopAddrTXT.Text, "%s") Then
        PopAddrStr = Replace(PopAddrTXT.Text, "%s", CallerID)
    Else
        PopAddrStr = PopAddrTXT.Text & CallerID
    End If
    
    If Trim(ExtenTXT.Text) = "" Or InStr(ExtenTXT.Text, DestPhone) Then '���ֻ��ı���Ϊ��ʱ,��������
        '������ʾ
        If BalloonCheck.Value = 1 Then
            TrayBalloon notification, "��" & vbCrLf & CallerID & "���" & DestPhone & "��", "���绰��", NIIF_INFO
        End If
        Shell "cmd /c start " & PopAddrStr '''''ʹ��Ĭ�����������
        Debug.Print "����" & DestPhone
    End If
End Function

Private Function WaitLogin(Str As String)
    If InStr(Str, "Response: Success") Then
        doLoginedSuccess
    ElseIf InStr(Str, "Response: Error") Then
        doLoginedError
    End If
End Function
Private Sub WinsockClient_Error(ByVal Number As Integer, Description As String, ByVal Scode As Long, ByVal Source As String, ByVal HelpFile As String, ByVal HelpContext As Long, CancelDisplay As Boolean)
    MsgBox Number & ":" & Description
    HostTXT.Enabled = True
    PortTXT.Enabled = True
    NameTXT.Enabled = True
    PswTXT.Enabled = True
End Sub

Private Function doLoginedSuccess()
    Logined = True
    loginCommand.Caption = "�ɹ���¼"
    notification.Caption = "AMI֪ͨ-�ѵ�¼"
    
    'WriteReg HostTXT '��¼�ɹ�ʱ�ѷ���������д��ע���
    'WriteReg PortTXT
    'WriteReg NameTXT
    'WriteReg PswTXT
    
    HostTXT.Enabled = False
    PortTXT.Enabled = False
    NameTXT.Enabled = False
    PswTXT.Enabled = False
End Function

Private Function doLoginedError()
    MsgBox "�ú������¼��������", vbExclamation, "��¼����"
End Function


Private Function WriteReg(Ob As Object)
Dim TN As String
TN = TypeName(Ob)
If TN = "TextBox" Then
    WSHShell.regwrite regPath & Ob.Name, Ob.Text, "REG_SZ"
ElseIf TN = "CheckBox" Then
    WSHShell.regwrite regPath & Ob.Name, Ob.Value, "REG_SZ"
End If
End Function

Private Function ReadReg(Ob As Object) As String
    On Error Resume Next
    ReadReg = WSHShell.RegRead(regPath & Ob.Name)
    'If txt <> "" Then
    '    TB.Text = txt
    'End If
End Function

Private Function WinsockClient_Closed()
    Logined = False
    notification.Caption = "�ѶϿ�������"
    loginCommand.Caption = "��¼"

    HostTXT.Enabled = True
    PortTXT.Enabled = True
    NameTXT.Enabled = True
    PswTXT.Enabled = True
End Function

Private Sub mShow_Click()
    
    notification.WindowState = 0
    notification.Show

End Sub

Private Sub mExit_Click()

    Unload Me

End Sub
