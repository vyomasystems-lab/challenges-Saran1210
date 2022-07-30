import cocotb
from cocotb.triggers import Timer, RisingEdge
from cocotb.result import TestFailure
from cocotb.clock import Clock

import random

class DffTB(object):
    def __init__(self, dut, dubug=True):
        self.dut = dut

    @cocotb.coroutine
    def reset(self, duration=10000):
        self.dut.log.info("Resetting DUT")
        self.dut.RST <= 1
        self.dut.D <= 0
        yield Timer(duration)
        yield RisingEdge(self.dut.CLK)
        self.dut.RST <= 0
        self.dut.log.info("Out of reset")

    @cocotb.coroutine
    def gen_and_check(self):
        D = random.randint(0, 255)
        self.dut.D = D;
        yield RisingEdge(self.dut.CLK)
        yield Timer(1)
        if int(self.dut.Q) != D :
            raise TestFailure(
                "[NG] Compre error. D==%s Q==%s" %  (D, int(self.dut.Q)))
        else :
            self.dut.log.info("[OK]")


    @cocotb.coroutine
    def clock_gen(signal):
        while True:
            signal <= 0
            yield Timer(5000)
            signal <= 1
            yield Timer(5000)

    @cocotb.test()
    def basic_test(dut):
    """basic_test"""
        tb = DffTB(dut)
        cocotb.fork(clock_gen(dut.CLK))
        yield RisingEdge(dut.CLK)
        yield tb.reset()

    for i in range(30):
        yield tb.gen_and_check()
