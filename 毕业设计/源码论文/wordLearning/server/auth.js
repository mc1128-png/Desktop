// 权限集合
var dict_auth = {};

/**
 * 授权类
 */
class Auth {
	constructor(arg) {

	}
}

/**
 * 公共权限校验
 * @param {Object} user 用户信息
 * @param {Object} ctx http请求上下文
 * @param {String} method 操作方法
 */
Auth.prototype.check = async function(user, path, method = "get") {
	var auth = await this.get_dict();

	var model_auth = null;

	var user_group = "游客";
	if (user) {
		user_group = user.user_group;
	}

	if (auth[path]) {
		var model_auth = auth[path][user_group];
		if (!model_auth) {
			model_auth = auth[path + "/list"]["游客"];
		}
	} else if (user_group === "管理员") {
		model_auth = {
			auth_id: 0,
			user_group: '管理员',
			mod_name: '',
			table_name: "",
			page_title: '',
			path: '',
			add: 1,
			del: 1,
			set: 1,
			get: 1,
			field_add: '',
			field_set: '',
			field_get: '',
			table_nav_name: '',
			table_nav: 1,
			option: {
				"examine": true,
				"can_show_comment": true,
				"can_comment": true,
				"can_show_score": true,
				"can_score": true
			}
		}
	} else {
		model_auth = {
			auth_id: 0,
			user_group: '访客',
			mod_name: '',
			table_name: "",
			page_title: '',
			path: '',
			add: 0,
			del: 0,
			set: 0,
			get: 1,
			field_add: '',
			field_set: '',
			field_get: '',
			table_nav_name: '',
			table_nav: 0,
			option: {
				"examine": false,
				"can_show_comment": false,
				"can_comment": false,
				"can_show_score": false,
				"can_score": false
			}
		}
	}
	if (model_auth[method]) {
		return model_auth;
	}
	return null;
};

/**
 * 鉴权
 * @param {Object} ctx HTTP上下文
 * @param {Object} db 数据管理器,如: { next: async function{}, ret: {} }
 * @return {Object} 执行结果
 */
Auth.prototype.get_dict = async function() {
	if (Object.keys(dict_auth).length === 0) {
		var service = $.services["auth"];
		var list = await service.get_list({}, {
			page: 0
		});
		for (var i = 0; i < list.length; i++) {
			var o = list[i];
			if (o.option) {
				o.option = JSON.parse(o.option);
			} else {
				o.option = {};
			}
			var path = o.path;
			if (!dict_auth[path]) {
				dict_auth[path] = {};
			}
			dict_auth[path][o.user_group] = o;
		}
	}
	return dict_auth;
};


var auth = new Auth();

/**
 * 鉴权函数
 * @param {Object} ctx http请求上下文
 * @param {Funtion} next 跳过函数
 */
module.exports = async function(ctx, next) {
	var path = ctx.path;
	var user = ctx.session.user;
	if (path.indexOf('/api') === 0) {
		var arr = path.split("/");
		var method = arr[arr.length - 1];
		var model_auth = null;
		path = "/" + arr[2] + "/";
		if (method.indexOf("get_list") !== -1 || method.indexOf('export') !== -1) {;
			model_auth = await auth.check(user, path + "list", "get");
			if (!model_auth) {
				model_auth = await auth.check(user, path + "table", "get");
			}
		} else if (method.indexOf("get_obj") !== -1) {
			model_auth = await auth.check(user, path + "view", "get");
			if (!model_auth) {
				model_auth = await auth.check(user, path + "details", "get");
			}
		} else if (method.indexOf('import') !== -1) {
			model_auth = await auth.check(user, path + "view", "set");
		} else {
			model_auth = await auth.check(user, path, "get");
		}
		if (model_auth) {
			ctx.auth = model_auth;
			await next();
		} else {
			ctx.body = {
				error: {
					code: 403,
					message: "没有访问权限"
				}
			};
		}
	} else {
		var model_auth = await auth.check(user, path, "get");
		if (model_auth) {
			ctx.auth = model_auth;
			await next();
		} else {
			ctx.status = 403;
			await ctx.render("403.html", {});
		}
	}
}
