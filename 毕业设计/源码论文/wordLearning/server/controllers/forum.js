var Controller = require("../core/Controller.js");

/**
 * 论坛
 */
class Forum extends Controller {
  /**
   * 构造函数
   * @param {Object} config 配置参数
   */
  constructor(config) {
    // 传参给父类构造函数
    super(
      Object.assign(
        {
          // 选择的模板那路径模板
          tpl: "./forum/",
          // 选择的服务
          service: "forum",
        },
        config
      )
    );
  }
}

module.exports = Forum;
