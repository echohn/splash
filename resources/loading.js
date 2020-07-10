var loading =  require('loading-cli')
var color = require('colors-cli')
var time = 300
var interval = function() {
  return 300 + (Math.random() - 0.5) * 300
}

var load = loading(" 正在准备接入...")
var show_loading

load.frames = ["◐", "◓", "◑", "◒"]

show_loading = function(text) {
  load.succeed()
  load.text = " " + text
  load.start()
}

steps = [
  "外部环境接触...没有异常",
  "精神污染测定值在基准范围内...",
  "思维传导系统开放，准备接驳...",
  "连通率为 100.00%",
  "思考形态以中文为基准，进行思维连接...",
  "A10 神经接续无异常,电化状态正常",
  "同步率为 400.0000%",
  "交互界面连接...",
  "第一安全装置解除...",
  "第二安全装置解除...",
  "双向回路开启...",
  "思维引导系统运作正常..."
]


load.start()

// for (_i = 0, _len = steps.length; _i < _len; _i++) {
//     step = steps[_i];
//     setTimeout(show_loading, time, step)
//     time = time + interval()
// }

steps.forEach(x => {
  setTimeout(show_loading, time, x)
  time = time + interval()
})

time = time + interval()

setTimeout(function(){
  load.succeed()
  console.log("\n" + color.green('✔') + "  初号机准备完成! ")
  process.exit()
}, time)

// 飞轮停止转动 解除接驳
// 辅助电压正常
// 冻结栓已排出
// 驾驶舱插入
// 探查针投入完毕
// 插入栓深度维持在20
// 精神污染测定值在基准范围内
// 插入栓维持在+02—-05
// 内部装置固定完毕
// 开始第一次接触
// 将LCL注入驾驶舱
// LCL浓度无异常压力正常
// 主电源接驳完毕
// 主电源接续动力传达所有回路
// 进入第二次接触
// 交互接口接驳
// A10神经接续无异常
// LCL电化状态正常
// 思考形态以日语为基础设定
// 初期接触完全无问题
// 双向回路开启
// 列表项1405为止全部通过
// 突触测量：同步率41.3%
// 调和率都在正常值没有失控现象
// 准备出动
// 第一锁定栓解除
// 确认解除
// 脐带桥开始移动
// 第二锁定栓解除
// 第一拘束器解除
// 第二拘束器解除
// 1号至15号安全装置解除 确认解除
// 内部电源充电完毕
// 外部电源连接正常
// 初号机直射出口
// 各磁悬浮轨道变位无问题
// 电磁引导系统运作正常
// 射出顺序按预算进行中
// 初号机到达发射口
// 发射台固定点已确定
// 射出通道已确认
// 前进路线清除无障碍
// 发射准备完成
// 初号机出动！
