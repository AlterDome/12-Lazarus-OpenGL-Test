program ogl_p1;

uses gl, glut;

var
  Cmd: array of PChar;
  CmdCount: Integer;
  ScreenWidth, ScreenHeight: Integer;

const
  AppWidth = 400;
  AppHeight = 400;

procedure DrawGLScene; cdecl;
begin
     glClear(GL_COLOR_BUFFER_BIT or GL_DEPTH_BUFFER_BIT);

     glBegin(GL_QUADS);
     glNormal3f( 0.0, 0.0, 1.0);
     glVertex3f( 0.5, 0.5, 0.5); glVertex3f(-0.5, 0.5, 0.5);
     glVertex3f(-0.5,-0.5, 0.5); glVertex3f( 0.5,-0.5, 0.5);

     glNormal3f( 0.0, 0.0,-1.0);
     glVertex3f(-0.5,-0.5,-0.5); glVertex3f(-0.5, 0.5,-0.5);
     glVertex3f( 0.5, 0.5,-0.5); glVertex3f( 0.5,-0.5,-0.5);

     glNormal3f( 0.0, 1.0, 0.0);
     glVertex3f( 0.5, 0.5, 0.5); glVertex3f( 0.5, 0.5,-0.5);
     glVertex3f(-0.5, 0.5,-0.5); glVertex3f(-0.5, 0.5, 0.5);

     glNormal3f( 0.0,-1.0, 0.0);
     glVertex3f(-0.5,-0.5,-0.5); glVertex3f( 0.5,-0.5,-0.5);
     glVertex3f( 0.5,-0.5, 0.5); glVertex3f(-0.5,-0.5, 0.5);

     glNormal3f( 1.0, 0.0, 0.0);
     glVertex3f( 0.5, 0.5, 0.5); glVertex3f( 0.5,-0.5, 0.5);
     glVertex3f( 0.5,-0.5,-0.5); glVertex3f( 0.5, 0.5,-0.5);

     glNormal3f(-1.0, 0.0, 0.0);
     glVertex3f(-0.5,-0.5,-0.5); glVertex3f(-0.5,-0.5, 0.5);
     glVertex3f(-0.5, 0.5, 0.5); glVertex3f(-0.5, 0.5,-0.5);
     glEnd();

     glutSwapBuffers;
end;

procedure ReSizeGLScene(Width, Height: Integer); cdecl;
begin
  glViewport(0, 0, Width, Height);
end;

procedure GLKeyboard(Key: Byte; X, Y: Longint); cdecl;
begin
  if Key = 27 then
    Halt(0);
end;

procedure InitializeGL;
begin
  glMatrixMode(GL_PROJECTION);
  glFrustum(-0.5, 0.5, -0.5, 0.5, 1.0, 3.0);

  glMatrixMode(GL_MODELVIEW);
  glTranslatef(0.0, 0.0, -2.0);

  glRotatef(30.0, 1.0, 0.0, 0.0);
  glRotatef(30.0, 0.0, 1.0, 0.0);

  glEnable(GL_DEPTH_TEST);
  glEnable(GL_LIGHTING);
  glEnable(GL_LIGHT0);
end;

begin

CmdCount := 1;
SetLength(Cmd, CmdCount);
Cmd[CmdCount-1] := PChar(ParamStr(CmdCount-1));

glutInit(@CmdCount, @Cmd);

glutInitDisplayMode(GLUT_DOUBLE or GLUT_RGB or GLUT_DEPTH);



glutInitWindowSize(AppWidth, AppHeight);

ScreenWidth := glutGet(GLUT_SCREEN_WIDTH);
ScreenHeight := glutGet(GLUT_SCREEN_HEIGHT);

glutInitWindowPosition((ScreenWidth - AppWidth) div 2,
   (ScreenHeight - AppHeight) div 2);

glutCreateWindow('ogl_p1');

InitializeGL;

glutDisplayFunc(@DrawGLScene);
glutReshapeFunc(@ReSizeGLScene);
glutKeyboardFunc(@GLKeyboard);

glutMainLoop;

end.



