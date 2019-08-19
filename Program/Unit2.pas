unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, math,
  Vcl.ComCtrls;

type
  TForm2 = class(TForm)
    Shape1: TShape;
    Label1: TLabel;
    Shape2: TShape;
    Button1: TButton;
    Label2: TLabel;
    Shape3: TShape;
    Timer1: TTimer;
    Timer2: TTimer;
    TrackBar1: TTrackBar;
    Label4: TLabel;
    Label3: TLabel;
    Shape4: TShape;
    Label5: TLabel;
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
      MousePos: TPoint; var Handled: Boolean);
    procedure Timer2Timer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;
  dx: real;
  direction_x, direction_y, step_ball, step, step_enemy: integer;
  procedure ball(pong, left, rignt: TShape);


implementation

{$R *.dfm}

procedure TForm2.Button1Click(Sender: TObject);
    begin
        Button1.Visible := False;
        TrackBar1.Visible := False;
        Label4.Visible := False;
        Label3.Visible := False;
        Timer1.Enabled := True;
        Shape4.Visible := True;
        direction_x := 2 * RandomRange(0, 1) - 1;
        direction_y := 2 * RandomRange(0, 1) - 1;
    end;

procedure TForm2.FormCreate(Sender: TObject);
var center: real;
    begin
        center := Form2.ClientWidth / 2;
        randomize;
        step_ball := 5;
        step := 15;
        step_enemy := 10;
        dx := RandomRange(3, 8) / 10;

        Shape1.Left := 30;
        Shape2.Left := Form2.ClientWidth - 30 - Shape2.Width;
        Shape4.Top := 0;
        Shape4.Height := Form2.ClientHeight;
        Shape4.Left := round(center - 0.5);

        Label1.Left := 8;
        Label2.Left := Form2.ClientWidth - 8 - Label2.Width;
        Label3.Left := round(center - (Label3.Width / 2));
        Label3.Top := 10;
        TrackBar1.Top := 50;
        Label4.Left := round(center - (Label4.Width / 2));
        Label4.Top := TrackBar1.Top + TrackBar1.Height + 5;
        Label3.Visible := False;
        Label5.Left := round(center - (Label5.Width / 2));
        Label5.Top := round((Form2.ClientHeight / 2) - (Label5.Height / 2));
        Label5.Visible := False;

        TrackBar1.Left := round(center - (TrackBar1.Width / 2));
        TrackBar1.Top := 50;
        TrackBar1Change(self);
        Button1.Left := round(center - (Button1.Width / 2));
        Button1.Top := Label4.Top + Label4.Height + 15;
    end;

procedure TForm2.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
    begin
        if Key = 40 then
            begin
                if (Shape1.Top + Shape1.Height) < (Form2.ClientHeight - step)  then
                    Shape1.Top := Shape1.Top + step
                else
                    Shape1.Top := Form2.ClientHeight - Shape1.Height;
            end;
        if Key = 38 then
            begin
                if Shape1.Top > step  then
                    Shape1.Top := Shape1.Top - step
                else
                    Shape1.Top := 0;
            end;
        if Key = 27 then
            begin
                Button1.Visible := True;
                TrackBar1.Visible := True;
                Label4.Visible := True;
                Label3.Caption := Label1.Caption + ' : ' + Label2.Caption;
                Label3.Visible := True;
                Label1.Caption := '0';
                Label2.Caption := '0';
                Timer1.Enabled := False;
                Shape4.Visible := False;
            end;
        if Key = 80 then
            begin
                Label5.Visible := not Label5.Visible;
                Label3.Visible := not Label3.Visible;
                Label3.Caption := Label1.Caption + ' : ' + Label2.Caption;
                Timer1.Enabled := not Timer1.Enabled;
                Timer2.Enabled := not Timer2.Enabled;
                Shape4.Visible := not Shape4.Visible;

            end;
        //label5.Caption := inttostr(Key);
    end;

procedure TForm2.FormMouseWheelDown(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
    begin
        if not Button1.Visible then
            begin
                if (Shape1.Top + Shape1.Height) < (Form2.ClientHeight - step)  then
                    Shape1.Top := Shape1.Top + step
                else
                    Shape1.Top := Form2.ClientHeight - Shape1.Height;
            end;
    end;

procedure TForm2.FormMouseWheelUp(Sender: TObject; Shift: TShiftState;
  MousePos: TPoint; var Handled: Boolean);
    begin
        if not Button1.Visible then
            begin
                if Shape1.Top > step  then
                    Shape1.Top := Shape1.Top - step
                else
                    Shape1.Top := 0;
            end;
    end;

procedure TForm2.Timer1Timer(Sender: TObject);
    begin
        if (Shape3.Left > Shape1.Left + Shape1.Width) and
                (Shape3.Left + Shape3.Width < Shape2.Left) and
                (Shape3.Top > 0) and (Shape3.Top + Shape3.Height < Form2.ClientHeight) then
            ball(Shape3, Shape1, Shape2)
        else if (Shape3.Left <= Shape1.Left + Shape1.Width) then
            begin
                if (Shape3.Top + Shape3.Height > Shape1.Top) and
                      (Shape3.Top < Shape1.Top + Shape1.Height) then
                    begin
                        direction_x := direction_x * (-1);
                        direction_y := direction_y * (-1);
                        dx := RandomRange(3, 8) / 10;
                    end
                else
                    begin
                        Label1.Caption := inttostr(strtoint(Label1.Caption) + 1);
                        dx := RandomRange(3, 8) / 10;
                        sleep(500);
                        Shape3.Top := round(Form2.ClientHeight / 2);
                        Shape3.Left := round(Form2.ClientWidth / 2)
                    end;
                ball(Shape3, Shape1, Shape2)
            end
        else if (Shape3.Left + Shape3.Width >= Shape2.Left) then
            begin
                if (Shape3.Top  + Shape3.Height > Shape2.Top) and
                      (Shape3.Top < Shape2.Top + Shape2.Height) then
                    begin
                        direction_x := direction_x * (-1);
                        direction_y := direction_y * (-1);
                        dx := RandomRange(3, 8) / 10;
                    end
                else
                    begin
                        Label2.Caption := inttostr(strtoint(Label2.Caption) + 1);
                        sleep(500);
                        dx := RandomRange(3, 8) / 10;
                        Shape3.Top := round(Form2.ClientHeight / 2);
                        Shape3.Left := round(Form2.ClientWidth / 2);
                    end;
                ball(Shape3, Shape1, Shape2)
            end;
        if (Shape3.Top <= 0) or (Shape3.Top + Shape3.Height >= Form2.ClientHeight) then
            begin
                direction_y := direction_y * (-1);
                ball(Shape3, Shape1, Shape2)
            end;
    end;

procedure TForm2.Timer2Timer(Sender: TObject);
var sign_pos: integer;
    tmp: real;
    begin
        tmp := (Shape2.Top + round(Shape2.Height / 2)) -
               (Shape3.Top + round(Shape3.Height / 2));
        if abs(tmp) > step_enemy then
            sign_pos := sign(tmp)
        else
            sign_pos := 0;
        if (sign_pos = 1) and (Shape3.Left > Form2.ClientWidth / 2) then
            begin
                if Shape2.Top > step then
                    Shape2.Top := Shape2.Top - step_enemy
                else
                    Shape2.Top := 0
            end
        else if (sign_pos = -1) and (Shape3.Left > Form2.ClientWidth / 2) then
            begin
                if (Shape2.Top + Shape2.Height) < (Form2.ClientHeight - step) then
                    Shape2.Top := Shape2.Top + step_enemy
                else
                    Shape2.Top := Form2.ClientHeight - Shape2.Height;
            end;
    end;

procedure TForm2.TrackBar1Change(Sender: TObject);
    begin
        Timer1.Interval := 30 - TrackBar1.Position;
        label4.Caption := 'Ball speed: ' + inttostr(TrackBar1.Position);
    end;

procedure ball(pong, left, rignt: TShape);
    begin
        pong.Left := pong.Left + round(dx * step_ball * direction_x);
        pong.Top := pong.Top + round((1 - dx) * step_ball * direction_y);
        if (pong.Top < 0) then
            pong.Top := 0
        else if pong.Top + pong.Height > Form2.ClientHeight then
            pong.Top := Form2.ClientHeight - pong.Height;
        if pong.left < left.Left + left.Width then
            pong.left := left.Left + left.Width
        else if pong.left + pong.Width > rignt.Left then
            pong.left := rignt.Left - pong.Width;
    end;

end.
