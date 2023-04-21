program stack;
type
    link=^node;
    node = record
        key: integer;
        next: link
    end;

var head,z: link;

procedure stackinit;
    begin
        new(head); new(z);
        head^.next:=z; z^.next:=z
    end;

procedure push(v:integer);
    var t:link;
    begin
        new(t);
        t^.key:=v; t^.next:=head^.next;
        head^.next:=t
    end;

function pop: integer;
    var t: link;
    begin
        t:=head^.next;
        pop:=t^.key;
        head^.next:=t^.next;
        dispose(t)
    end;

function stackempty: boolean;
    begin stackempty:=(head^.next=z) end;

    {you've added all your functions above but you still need a main program...}

begin
    stackinit;
    push(1);
    push(2);
    writeln(pop);
    writeln(pop);
    writeln(stackempty);
end.


