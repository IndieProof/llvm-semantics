; ModuleID = '/home/david/src/c-semantics/tests/gcc-torture/20020103-1.c'
target datalayout = "e-p:64:64:64-i1:8:8-i8:8:8-i16:16:16-i32:32:32-i64:64:64-f32:32:32-f64:64:64-v64:64:64-v128:128:128-a0:0:64-s0:64:64-f80:128:128-n8:16:32:64-S128"
target triple = "x86_64-unknown-linux-gnu"

define i64 @foo(i64 %a) nounwind uwtable readnone {
entry:
  %xor = xor i64 %a, 65535
  ret i64 %xor
}

define i64 @bar(i64 %a) nounwind uwtable readnone {
entry:
  %xor = xor i64 %a, 4294901760
  ret i64 %xor
}

define i32 @main() noreturn nounwind uwtable {
if.end4:
  tail call void @exit(i32 0) noreturn nounwind
  unreachable
}

declare void @exit(i32) noreturn
