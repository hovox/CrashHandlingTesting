//
//  MyCxx.cpp
//  CrashHandlingTest
//
//  Created by Hovhannes Safaryan on 15.02.21.
//

#import "MyCxx.h"
#include <thread>

struct ExceptionsA {
    
};

void throwFromThread(const char* msg) {
    std::abort();
    throw msg;
}

template <int N>
[[gnu::noinline]] void inner(const char* msg) {
    inner<N-1>(msg);
}

template <>
[[gnu::noinline]] void inner<0>(const char* msg) {
    throwFromThread(msg);
}

void noExceptTest(const char* msg) noexcept {
    inner<5>(msg);
}

void CxxCrashExample(void) {
    try {
        inner<5>("testing abort");
    } catch (...) {
        std::terminate();
    }
}

void CxxCrashExample2(void) {
    noExceptTest("no except test");
}

void CxxCrash2(void) {
    int x = *(int*)0;
}

void CxxCrashStruct(void) {
  throw ExceptionsA();
}


[[gnu::noinline]] void CxxNativeWithiOSStack(void) {
    std::thread([](){
        noExceptTest("noexcept test from thread");
        }).join();
}
