var Controller = require("../core/Controller.js");

/**
 * 论坛类型
 */
class Forum_type extends Controller {
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
          tpl: "./forum_type/",
          // 选择的服务
          service: "forum_type",
        },
        config
      )
    );
  }
}

module.exports = Forum_type;
