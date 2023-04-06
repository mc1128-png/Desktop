var Service = require('../core/service.js');

/**
 * 单词大全服务
 */
class Encyclopedia_of_words extends Service {
	/**
	 * 构造函数
	 * @param {Object} config 配置参数
	 */
	constructor(config) {
		// 传参给父类构造函数
		super(Object.assign({
			// 操作的表
			table: "encyclopedia_of_words",
			// 分页大小
			size: 1
		}, config));
	}
}

module.exports = {
Encyclopedia_of_words
};
