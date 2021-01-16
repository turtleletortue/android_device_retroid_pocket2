#define LOG_TAG "CallStack_shim"

#include <backtrace/Backtrace.h>
#include <utils/CallStack.h>
#include <utils/Errors.h>
#include <utils/Log.h>
#include <utils/Printer.h>

#include <memory>

using namespace android;

CallStack::CallStack() {}

CallStack::CallStack(const char* logtag, int32_t ignoreDepth) {
  this->update(ignoreDepth + 1);
  this->log(logtag);
}

CallStack::~CallStack() {}

void CallStack::update(int32_t ignoreDepth, pid_t tid) { mFrameLines.clear(); }

void CallStack::log(const char* logtag, android_LogPriority priority,
                    const char* prefix) const {
  LogPrinter printer(logtag, priority, prefix, /*ignoreBlankLines*/ false);
  print(printer);
}

void CallStack::dump(int fd, int indent, const char* prefix) const {
  FdPrinter printer(fd, indent, prefix);
  print(printer);
}

String8 CallStack::toString(const char* prefix) const {
  String8 str;

  String8Printer printer(&str, prefix);
  print(printer);

  return str;
}
