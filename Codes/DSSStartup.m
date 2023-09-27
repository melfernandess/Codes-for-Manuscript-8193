
function [Start,Obj,Text] = DSSStartup
 
    Obj = actxserver('OpenDSSEngine.DSS');
    Start = Obj.Start(0);

    % Define interface
    Text = Obj.Text;    