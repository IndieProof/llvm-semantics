; ModuleID = '/home/david/src/c-semantics/tests/llvm-unit/2005-11-29-LongSwitch.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

@.str = private unnamed_addr constant [10 x i8] c"foo = %d\0A\00", align 1

define i32 @foo(i64 %v) nounwind uwtable readnone {
entry:
  switch i64 %v, label %sw.epilog [
    i64 0, label %return
    i64 -1, label %sw.bb1
  ]

sw.bb1:                                           ; preds = %entry
  br label %return

sw.epilog:                                        ; preds = %entry
  br label %return

return:                                           ; preds = %entry, %sw.epilog, %sw.bb1
  %retval.0 = phi i32 [ 0, %sw.epilog ], [ 2, %sw.bb1 ], [ 1, %entry ]
  ret i32 %retval.0
}

define i32 @main() nounwind uwtable {
entry:
  %call1 = tail call i32 (i8*, ...)* @printf(i8* getelementptr inbounds ([10 x i8]* @.str, i64 0, i64 0), i32 0) nounwind
  ret i32 0
}

declare i32 @printf(i8* nocapture, ...) nounwind