program StackUsingLinkedList;
type
    TData = Integer;

    PNode = ^TNode;
    TNode = record
        data: TData;
        next: PNode;
    end;

    TStack = record
        top: PNode;
    end;

procedure InitializeStack(var stack: TStack);
begin
    stack.top := nil;
end;

function IsEmpty(const stack: TStack): Boolean;
begin
    IsEmpty := stack.top = nil;
end;

procedure Push(var stack: TStack; value: TData);
var
    newNode: PNode;
begin
    New(newNode);
    newNode^.data := value;
    newNode^.next := stack.top;
    stack.top := newNode;
end;

function Pop(var stack: TStack): TData;
var
    tempNode: PNode;
begin
    if IsEmpty(stack) then
    begin
        WriteLn('Error: Stack is empty');
        Halt(1);
    end;

    tempNode := stack.top;
    Pop := tempNode^.data;
    stack.top := tempNode^.next;
    Dispose(tempNode);
end;

procedure Display(const stack: TStack);
var
    currentNode: PNode;
begin
    if IsEmpty(stack) then
    begin
        WriteLn('Stack is empty');
        Exit;
    end;

    currentNode := stack.top;
    Write('Stack: ');
    while currentNode <> nil do
    begin
        Write(currentNode^.data, ' ');
        currentNode := currentNode^.next;
    end;
    WriteLn;
end;

var
    stack: TStack;
begin
    InitializeStack(stack);
    Push(stack, 10);
    Push(stack, 20);
    Push(stack, 30);
    Display(stack);

    WriteLn('Popped value: ', Pop(stack));
    Display(stack);
end.

