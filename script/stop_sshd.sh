#!/bin/sh

pidof sshd | xargs kill -TERM
