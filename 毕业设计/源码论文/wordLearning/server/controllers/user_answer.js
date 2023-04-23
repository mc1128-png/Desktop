var Controller = require("../core/Controller.js");

/**
 * 考试答题
 */
class User_Answer extends Controller {
	/**
	 * 构造函数
	 * @param {Object} config 配置参数
	 */
	constructor(config) {
		// 传参给父类构造函数
		super(
			Object.assign({
					// 选择的模板那路径模板
					tpl: "./user_answer/",
					// 选择的服务
					service: "user_answer",
				},
				config
			)
		);
	}
}

module.exports = User_Answer;
