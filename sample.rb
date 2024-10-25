def hi(name)
  "hi #{name}. Good #{yield}"
end

res = hi "pras" do
  "Evening!"
end
p res

blk = ->() { "MOninrg!!!" }
# p blk.call()

res = hi "pras", &blk
p res
