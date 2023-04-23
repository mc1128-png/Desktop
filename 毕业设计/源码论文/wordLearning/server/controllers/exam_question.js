var Controller = require("../core/Controller.js");

/**
 * 考试题目
 */
class Exam_Question extends Controller {
	/**
	 * 构造函数
	 * @param {Object} config 配置参数
	 */
	constructor(config) {
		// 传参给父类构造函数
		super(
			Object.assign({
					// 选择的模板那路径模板
					tpl: "./exam_question/",
					// 选择的服务
					service: "exam_question",
				},
				config
			)
		);
	}
}

module.exports = Exam_Question;
