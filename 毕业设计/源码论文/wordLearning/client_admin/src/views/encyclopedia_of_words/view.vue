<template>
	<el-main class="bg edit_wrap">
		<el-form ref="form" :model="form" status-icon label-width="120px" v-if="is_view()">
			<el-col v-if="user_group === '管理员' || $check_field('get','word') || $check_field('add','word') || $check_field('set','word')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="单词" prop="word">
					<el-input id="word" v-model="form['word']" placeholder="请输入单词"
							  v-if="user_group === '管理员' || (form['encyclopedia_of_words_id'] && $check_field('set','word')) || (!form['encyclopedia_of_words_id'] && $check_field('add','word'))" :disabled="disabledObj['word_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','word')">{{form['word']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','interpretation') || $check_field('add','interpretation') || $check_field('set','interpretation')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="释义" prop="interpretation">
					<el-input id="interpretation" v-model="form['interpretation']" placeholder="请输入释义"
							  v-if="user_group === '管理员' || (form['encyclopedia_of_words_id'] && $check_field('set','interpretation')) || (!form['encyclopedia_of_words_id'] && $check_field('add','interpretation'))" :disabled="disabledObj['interpretation_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','interpretation')">{{form['interpretation']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','pronunciation') || $check_field('add','pronunciation') || $check_field('set','pronunciation')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="读音" prop="pronunciation">
					<el-upload v-if="user_group === '管理员' || (form['encyclopedia_of_words_id'] && $check_field('set','pronunciation')) || (!form['encyclopedia_of_words_id'] && $check_field('add','pronunciation'))" class="upload-demo" drag
						action="" style="max-width: 300px;width: 100%;" :http-request="upload_pronunciation" :limit="1" accept="audio/ogg,audio/mp3,audio/wav">
						<i class="el-icon-upload"></i>
						<div class="el-upload__text">将音频拖到此处，或<em>点击上传</em></div>
					</el-upload>
					<div v-else-if="$check_field('get','pronunciation')">
						<el-button type="primary" @click="download(form['pronunciation'])">下载<i
								class="el-icon-download el-icon--right"></i></el-button>
					</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','picture') || $check_field('add','picture') || $check_field('set','picture')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="图片" prop="picture">
					<el-upload :disabled="disabledObj['picture_isDisabled']" id="picture" class="avatar-uploader" drag
						accept="image/gif, image/jpeg, image/png, image/jpg" action="" :http-request="upload_picture"
						:show-file-list="false" v-if="user_group === '管理员' || (form['encyclopedia_of_words_id'] && $check_field('set','picture')) || (!form['encyclopedia_of_words_id'] && $check_field('add','picture'))">
						<img v-if="form['picture']" :src="$fullUrl(form['picture'])" class="avatar">
						<i v-else class="el-icon-plus avatar-uploader-icon"></i>
					</el-upload>
					<el-image v-else-if="$check_field('get','picture')" style="width: 100px; height: 100px"
						:src="$fullUrl(form['picture'])" :preview-src-list="[$fullUrl(form['picture'])]">
						<div slot="error" class="image-slot">
							<img src="../../../public/img/error.png" style="width: 90px; height: 90px" />
						</div>
					</el-image>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','word_category') || $check_field('add','word_category') || $check_field('set','word_category')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="单词类别" prop="word_category">
					<el-select id="word_category" v-model="form['word_category']"
						v-if="user_group === '管理员' || (form['encyclopedia_of_words_id'] && $check_field('set','word_category')) || (!form['encyclopedia_of_words_id'] && $check_field('add','word_category'))">
						<el-option v-for="o in list_word_category" :key="o['word_category']" :label="o['word_category']"
							:value="o['word_category']">
						</el-option>
					</el-select>
					<div v-else-if="$check_field('get','word_category')">{{form['word_category']}}</div>
				</el-form-item>
			</el-col>
			<el-col v-if="user_group === '管理员' || $check_field('get','memory_skills') || $check_field('add','memory_skills') || $check_field('set','memory_skills')" :xs="24" :sm="12" :lg="8" class="el_form_item_warp">
				<el-form-item label="记忆技巧" prop="memory_skills">
					<el-input type="textarea" id="memory_skills" v-model="form['memory_skills']" placeholder="请输入记忆技巧"
						v-if="user_group === '管理员' || (form['encyclopedia_of_words_id'] && $check_field('set','memory_skills')) || (!form['encyclopedia_of_words_id'] && $check_field('add','memory_skills'))" :disabled="disabledObj['memory_skills_isDisabled']"></el-input>
					<div v-else-if="$check_field('get','memory_skills')">{{form['memory_skills']}}</div>
				</el-form-item>
			</el-col>
			<el-col :xs="24" :sm="12" :lg="8" class="el_form_btn_warp">
				<el-form-item>
					<el-button type="primary" @click="submit()">提交</el-button>
					<el-button @click="cancel()">取消</el-button>
				</el-form-item>
			</el-col>

		</el-form>
	</el-main>
</template>

<script>
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		data() {
			return {
				field: "encyclopedia_of_words_id",
				url_add: "~/api/encyclopedia_of_words/add?",
				url_set: "~/api/encyclopedia_of_words/set?",
				url_get_obj: "~/api/encyclopedia_of_words/get_obj?",
				url_upload: "~/api/encyclopedia_of_words/upload?",

				query: {
					"encyclopedia_of_words_id": 0,
				},

				form: {
					"word":'', // 单词
					"interpretation":'', // 释义
					"pronunciation":'', // 读音
					"picture":'', // 图片
					"word_category":'', // 单词类别
					"memory_skills":'', // 记忆技巧
					"encyclopedia_of_words_id": 0, // ID

				},
				disabledObj:{
					"word_isDisabled": false,
					"interpretation_isDisabled": false,
					"pronunciation_isDisabled": false,
					"picture_isDisabled": false,
					"word_category_isDisabled": false,
					"memory_skills_isDisabled": false,
				},
				//单词类别选项列表
				list_word_category: [],
			}
		},
		methods: {
			/**
			 * 上传读音
			 * @param {Object} param音频参数
			 */
			upload_pronunciation(param){
				this.uploadFile(param.file, "pronunciation");
			},
			/**
			 * 上传图片
			 * @param {Object} param图片参数
			 */
			upload_picture(param){
				this.uploadFile(param.file, "picture");
			},
			/**
			 * 获取单词类别列表
			 */
			async get_list_word_category() {
				var json = await this.$get("~/api/word_classification/get_list?");
				if(json.result && json.result.list){
					this.list_word_category = json.result.list;
				}
				else if(json.error){
					console.error(json.error);
				}
			},

			/**
			 * 获取对象之前
			 * @param {Object} param
			 */
			get_obj_before(param) {
				var form = "";
				if(this.form && form){
					Object.keys(this.form).forEach(key => {
						Object.keys(form).forEach(dbKey => {
							// if(dbKey === "charging_standard"){
							// 	this.form['charging_rules'] = form[dbKey];
							// 	this.disabledObj['charging_rules_isDisabled'] = true;
							// };
							if(key === dbKey){
								this.disabledObj[key+'_isDisabled'] = true;
							}
						})
					})
				}
				$.db.del("form");
				return param;
			},

			/**
			 * 获取对象之后
			 * @param {Object} json
			 * @param {Object} func
			 */
			get_obj_after(json, func){
			},

			is_view(){
				var bl = this.user_group == "管理员";

				if(!bl){
					bl = this.$check_action('/encyclopedia_of_words/table','add');
					console.log(bl ? "你有表格添加权限视作有添加权限" : "你没有表格添加权限");
				}
				if(!bl){
					bl = this.$check_action('/encyclopedia_of_words/table','set');
					console.log(bl ? "你有表格添加权限视作有修改权限" : "你没有表格修改权限");
				}
				if(!bl){
					bl = this.$check_action('/encyclopedia_of_words/view','add');
					console.log(bl ? "你有视图添加权限视作有添加权限" : "你没有视图添加权限");
				}
				if(!bl){
					bl = this.$check_action('/encyclopedia_of_words/view','set');
					console.log(bl ? "你有视图修改权限视作有修改权限" : "你没有视图修改权限");
				}
				if(!bl){
					bl = this.$check_action('/encyclopedia_of_words/view','get');
					console.log(bl ? "你有视图查询权限视作有查询权限" : "你没有视图查询权限");
				}

				console.log(bl ? "具有当前页面的查看权，请注意这不代表你有字段的查看权" : "无权查看当前页，请注意即便有字段查询权限没有页面查询权限也不行");

				return bl;
			},
			/**
			 * 上传文件
			 * @param {Object} param
			 */
			uploadimg(param) {
				this.uploadFile(param.file, "avatar");
			},

		},
		created() {
			this.get_list_word_category();
		},
	}
</script>

<style>
	.avatar-uploader .el-upload {
		border: 1px dashed #d9d9d9;
		border-radius: 6px;
		cursor: pointer;
		position: relative;
		overflow: hidden;
	}

	.avatar-uploader .el-upload:hover {
		border-color: #409EFF;
	}

	.avatar-uploader-icon {
		font-size: 28px;
		color: #8c939d;
		width: 178px;
		height: 178px;
		line-height: 178px;
		text-align: center;
	}

	.avatar {
		width: 178px;
		height: 178px;
		display: block;
	}
</style>
