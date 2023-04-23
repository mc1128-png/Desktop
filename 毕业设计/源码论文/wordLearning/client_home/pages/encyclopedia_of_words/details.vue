<template>
	<view class="page_encyclopedia_of_words diy_detail" id="encyclopedia_of_words_details">
		<view class="warp">
			<view class="container-fluid">
				<view class="row">
					<view v-if="$check_field('get','word')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>单词</span>
							</view>
							<view class="diy_field diy_text">
								<span>
									{{ obj["word"] }}
								</span>
							</view>
						</view>
					</view>
					<view v-if="$check_field('get','interpretation')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>释义</span>
							</view>
							<view class="diy_field diy_text">
								<span>
									{{ obj["interpretation"] }}
								</span>
							</view>
						</view>
					</view>
					<view v-if="$check_field('get','pronunciation')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>读音</span>
							</view>
							<view class="diy_field diy_music">
								<audio v-if="obj['pronunciation']" style="text-align: left" :src="$fullUrl(obj['pronunciation'])" controls></audio>
							</view>
						</view>
					</view>
					<view v-if="$check_field('get','picture')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>图片</span>
							</view>
							<view class="diy_field diy_img">
								<img :src="$fullUrl(obj['picture'])" />
							</view>
						</view>
					</view>
					<view v-if="$check_field('get','word_category')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>单词类别</span>
							</view>
							<view class="diy_field diy_text">
								<span>
									{{ obj["word_category"] }}
								</span>
							</view>
						</view>
					</view>
					<view v-if="$check_field('get','memory_skills')" class="col-12 col-6">
						<view class="view">
							<view class="diy_title">
								<span>记忆技巧</span>
							</view>
							<view class="diy_field diy_desc">
								<span>
									{{ obj["memory_skills"] }}
								</span>
							</view>
						</view>
					</view>
				</view>
			</view>
			<view class="row">
				<view class="col-12 col-md-4">
					<span>点赞{{ obj["praise_len"] }}</span>
				</view>
				<view class="col-12 col-md-4">
					<span>点击数{{ obj["hits"] }}</span>
				</view>
			</view>
		</view>
		<!-- 评论区标题 -->
		<bar_title :title="bar_title" :url="bar_url"></bar_title>

		<!-- 评论区列表 -->
		<list_comment :list="list_comment"></list_comment>

		<view class="warp">
			<view class="container-fluid">
				<view class="row">
					<view class="col">

<!--						<button type="button" class="btn btn-primary" @click="cancel()">返回</button>-->
						<button type="button" class="btn btn-primary" @click="change_praise()">
							<span>点赞</span>
						</button>
						<navigator class="link"
							:url="'/pages/comment/edit?source_table=encyclopedia_of_words&source_field=encyclopedia_of_words_id&source_id=' + obj['encyclopedia_of_words_id']">
							评论
						</navigator>
						<navigator @click="change_collect()" class="publish_box">
							<uni-icons type="heart"></uni-icons>
							<text>收藏</text>
						</navigator>
					</view>
				</view>
			</view>
		</view>

	</view>
</template>

<script>
	import list_comment from "@/components/diy/list_comment.vue";
	import bar_title from "@/components/diy/bar_title.vue";
	import form_editor from "@/components/diy/form_editor.vue";

	import mixin from "@/mixins/page.js";
	export default {
		mixins: [mixin],
		components: {
			list_comment,
			bar_title,
			form_editor
		},
		data() {
			return {
				url_get_obj: "~/api/encyclopedia_of_words/get_obj?",
				field: "encyclopedia_of_words_id",
				query: {
					"encyclopedia_of_words_id": 0
				},
				// 商品详情初始化
				obj: {
					"word": "",
					"interpretation": "",
					"pronunciation": "",
					"picture": "",
					"word_category": "",
					"memory_skills": "",
					"hits": 0,
					"praise_len": 0,
					"encyclopedia_of_words_id": 0,

				},
				// 点赞
				praise: 0,
				// 点赞状态
				state_praise: false,
				// 收藏
				collect: 0,
				// 收藏状态
				state_collect: false,
				// 评论列表初始化
				list_comment: [],
				// 评论bar标题
				bar_title: "评论区",
				// 评论bar的链接
				bar_url: "",
			}
		},
		methods: {
			/**
			 * 获取点赞
			 * @param {Object} obj
			 */
			get_praise(obj) {
				var user_id = this.user.user_id;

				this.$get("~/api/praise/count?", {
					source_table: "encyclopedia_of_words",
					source_field: "encyclopedia_of_words_id",
					source_id: obj["encyclopedia_of_words_id"]
				}, (res) => {
					if (res.result || res.result === 0) {
						this.praise = res.result;
						console.log("点赞数：" ,res.result);
					}
					else if (res.error){
						this.$toast(res.error.message);
						console.error(res.error);
					}
				});

				this.$get("~/api/praise/count?", {
					source_table: "encyclopedia_of_words",
					source_field: "encyclopedia_of_words_id",
					source_id: obj["encyclopedia_of_words_id"],
					user_id
				}, (res) => {
					if (res.result || res.result === 0) {
						this.state_praise = res.result ? true : false;
						console.log("点赞状态：" ,res.result);
					}
					else if (res.error){
						this.$toast(res.error.message);
						console.error(res.error);
					}
				})
			},

			/**
			 * 改变点赞数
			 */
			change_praise(obj) {
				var user_id = this.user.user_id;

				var query = {
					source_table: "encyclopedia_of_words",
					source_field: "encyclopedia_of_words_id",
					source_id: this.obj["encyclopedia_of_words_id"],
					user_id
				};

				var _this = this;
        _this.obj.praise_len = parseInt(_this.obj.praise_len)
				// 点赞状态
				if (this.state_praise) {
					this.state_praise = false;
					this.$get('~/api/praise/del?', query, (res) => {
						if(res.result){
							var praise_len = _this.obj.praise_len-1
							this.$post('~/api/encyclopedia_of_words/set?encyclopedia_of_words_id=' + _this.obj["encyclopedia_of_words_id"], {
								praise_len
							}, (res) => {
								if(res.result){
									console.log("添加点赞数状态：" ,res.result);
								}
								else if(res.error){
									console.error(res.error);
								}
							});
							this.$toast("取消点赞");
						}
						else if (res.error){
							this.$toast(res.error.message);
							console.error(res.error);
						}
					});
				} else {
					this.state_praise = true;
					this.$post('~/api/praise/add?', query, (res) => {
						if (res.result) {
							var praise_len = _this.obj.praise_len+1
							this.$post('~/api/encyclopedia_of_words/set?encyclopedia_of_words_id=' + _this.obj["encyclopedia_of_words_id"], {
								praise_len
							}, (res) => {
								if(res.result){
									console.log("添加点赞数状态：" ,res.result);
								}
								else if(res.error){
									console.error(res.error);
								}
							});
							this.$toast("点赞成功");
						}
						else if (res.error) {
							this.$toast(res.error.message);
							console.error(res.error);
						}
					});
				};
			},
			/**
			 * 初始化收藏状态
			 * @param {Object} obj
			 */
			get_collect(obj) {
				var user_id = this.user.user_id;

				var query = {
					source_table: "encyclopedia_of_words",
					source_field: "encyclopedia_of_words_id",
					source_id: obj["encyclopedia_of_words_id"],
					user_id
				};

				this.$get('~/api/collect/count?', query, (res) => {
					console.log(res);
					if (res.result || res.result === 0) {
						var bl = res.result ? true : false;
						this.state_collect = bl;
						console.log("收藏状态：" + bl);
					}
					else if(res.error) {
						console.error(res.error);
					}
				});
			},

			/**
			 * 改变收藏状态
			 */
			change_collect() {
				var user_id = this.user.user_id;

				var query = {
					source_table: "encyclopedia_of_words",
					source_field: "encyclopedia_of_words_id",
					source_id: this.obj["encyclopedia_of_words_id"],
					user_id
				};

				// 收藏状态
				if (this.state_collect) {
					this.state_collect = false;
					this.$get('~/api/collect/del?', query, (res) => {
						if(res.result){
							this.$toast("取消收藏");
						}
						else if (res.error){
							this.$toast(res.error.message);
							console.error(res.error);
						}
					});
				} else {
					this.state_collect = true;
					query.title = this.obj.word
					query.img = this.obj.picture
					this.$post('~/api/collect/add?', query, (res) => {
						if (res.result) {
							this.$toast("收藏成功");
						}
						else if (res.error) {
							this.$toast(res.error.message);
							console.error(res.error);
						}
					});
				};
			},
			/**
			 * 获取评论
			 * @param {Object} obj
			 */
			get_comment(obj) {
				this.$get("~/api/comment/get_list?", {
					source_table: "encyclopedia_of_words",
					source_field: "encyclopedia_of_words_id",
					source_id: obj["encyclopedia_of_words_id"]
				}, (res) => {
					if (res.result && res.result.list) {
						var list = res.result.list;
						this.list_comment = list;
						console.log("评论请求结果：" ,list);
					}
					else if (res.error){
						console.error(res.error);
					}
				});
			},
			/**
			 * 添加访问量
			 */
			add_hits(obj) {
				obj["hits"] = obj["hits"] + 1;
				var hits = obj["hits"];
				this.$post('~/api/encyclopedia_of_words/set?encyclopedia_of_words_id=' + obj["encyclopedia_of_words_id"], {
					hits
				}, (res) => {
					if(res.result){
						console.log("添加访问量状态：" ,res.result);
						var body = {
							source_table: "encyclopedia_of_words",
							source_field: "encyclopedia_of_words_id",
							source_id: this.obj.encyclopedia_of_words_id,
							user_id: this.$store.state.user.user_id,
						};
						this.$post("~/api/hits/add?", body, (res) => {
							console.log(res);
						});
					}
					else if(res.error){
						console.error(res.error);
					}
				});
			},

			/**
			 * 获取对象之后
			 * @param {Object} json 结果对象
			 */
			get_obj_after(json) {
				// 判断是否获取到数据
				if (this.obj) {
					var obj = this.obj;
					// 获取点赞数
					this.get_praise(obj);
					// 初始化收藏状态
					this.get_collect(obj);
					// 获取评论
					this.get_comment(obj);
					// 增加点击数
					this.add_hits(obj);
				}
			},
		},
		created() {
		},
		mounted() {
		},
	}

</script>

<style>
	.page_goods {
		padding-bottom: 3rem;
	}

	.link {
		text-align: center;
		padding: 0.5rem 0;
		border: 1px solid #DBDBDB;
		border-radius: 0.5rem;
	}

	.buy_wrap {
		position: fixed;
		bottom: 0;
		left: 0;
		width: 100%;
	}

	.dialog {
		width: 100%;
		height: 100vh;
		background: rgba(0, 0, 0, 0.5);
		z-index: 999;
		position: fixed;
		left: 0;
		top: 0;
		padding: 20vh 0;
	}

	.dialog-content {
		width: 500upx;
		height: 60vh;
		margin: 0 auto;
		background: #FFF;
		border-radius: 10upx;
		overflow: hidden;
		position: relative;
		display: flex;
		flex-direction: column;
		padding:  5vh;
		text-align: center;

	}
	.dialog-content span{
		margin-top:  3vh;
		}

	.dialog-close {
		width: 40upx;
		height: 40upx;
		border-radius: 20upx;
		position: absolute;
		right: 10upx;
		top: 10upx;
		font-size: 26upx;
		line-height: 40upx;
		text-align: center;
	}

	.dialog-list {
		padding: 40upx 20upx;
	}

	scroll-view {
		width: 100%;
		height: 100%;
	}

	.show-dialog {
		animation: 100ms showDialog linear forwards;
	}

	.hide-dialog {
		animation: 100ms hideDialog linear forwards;
	}

	@keyframes hideDialog {
		0% {
			opacity: 1;
		}


		100% {
			opacity: 0;
		}
	}

	@keyframes showDialog {
		0% {
			opacity: 0;
		}


		100% {
			opacity: 1;
		}
	}


</style>
