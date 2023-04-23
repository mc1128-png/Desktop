var Service = require('../core/service.js');

/**
 * 单词分类服务
 */
class Word_classification extends Service {
	/**
	 * 构造函数
	 * @param {Object} config 配置参数
	 */
	constructor(config) {
		// 传参给父类构造函数
		super(Object.assign({
			// 操作的表
			table: "word_classification",
			// 分页大小
			size: 1
		}, config));
	}
}

module.exports = {
Word_classification
};
