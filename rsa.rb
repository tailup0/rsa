#!/usr/bin/env ruby
# RSA
# 暗号文=平文^E mod N
# { E, N } 公開鍵
# 平文=暗号文^D mod N
# { D, N } プライベート鍵
p = 227
q = 4099
n = p * q

# 最小公倍数
# E,Dを求めるためにLが必要
l = (p - 1).lcm(q - 1)

# Eの求め方
# gcd 最大公約数
# 条件1)
# 1 < E < L
# 条件2)
# gcd(E,L)=1
e = (1...l).each { |i| break i if (i > 1 && i.gcd(l) == 1) }

# Dの求め方
# gcd 最大公約数
# 条件1)
# 1 < E < L
# 条件2)
# (E*D)modL=1
d = (1...l).each { |i| break i if (i > 1 && (e * i) % l == 1) }

puts "E:#{e} N:#{n} D:#{d}"
