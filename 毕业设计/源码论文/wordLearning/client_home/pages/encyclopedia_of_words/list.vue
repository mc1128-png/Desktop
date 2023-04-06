<template>
	<view class="page_encyclopedia_of_words diy_list diy_list_page" id="encyclopedia_of_words_list">
		<!-- 筛选模块(开始) -->
		<mm_warp>
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view class="">
							<!-- 搜索栏 -->
							<uni-search-bar placeholder="搜索单词" @confirm="search" @cancel="cancel" cancelText="取消"
											@input="input($event, 'word')">
								<uni-icons slot="searchIcon" color="#999999" size="18" type="home" />
							</uni-search-bar>
							<uni-search-bar placeholder="搜索释义" @confirm="search" @cancel="cancel" cancelText="取消"
											@input="input($event, 'interpretation')">
								<uni-icons slot="searchIcon" color="#999999" size="18" type="home" />
							</uni-search-bar>
							<!-- /搜索栏 -->
						</mm_view>
					</mm_col>
				</mm_row>

				<mm_row>
					<mm_col>
						<mm_view class="tab_view">
							<!-- 筛选栏 -->
							<!--<list_tab activeColor="var(&#45;&#45;color_primary)" lineColor="var(&#45;&#45;color_primary)" :list="list_word_category"-->
									  <!--v-model="query['word_category']" @change="changeScreen('word_category')" field="word_category"></list_tab>-->
							<label>单词类别</label>
							<select style="width: 100px" v-model="query['word_category']" class="query_select" @change="changeScreen('word_category')" >
								<option class="query_option" value="">全部</option>
								<option class="query_option" v-for="(o,i) in list_word_category" :value="o.word_category">{{o.word_category}}</option>
							</select>
							<!-- /筛选栏 -->
						</mm_view>
					</mm_col>
				</mm_row>

				<mm_row>
					<mm_col>
						<mm_view class="sort_view">
							<!-- 排序 -->
							<view class="list_orderby">
								<bar_orderby :text="o.name" v-model:direction="o.direction"
											 v-for="(o,i) in list_orderby" :key="i" @handle="handleOrderby">
								</bar_orderby>
							</view>
							<!-- /排序 -->
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!-- 筛选模块(结束) -->
		<!-- 列表 -->
		<view class="change_table">
			<button class="btn btn-primary btn_change_table" @click="show_Img = !show_Img">
				{{ show_Img ? "切换成表格" : "切换成视图" }}
			</button>
		</view>

		<view v-show="!show_Img">
			<uni-table stripe border emptyText="暂无更多数据">
				<uni-tr>
					<uni-th v-if="$check_field('get','word')" align="center">
						<span>单词
						</span>
					</uni-th>
					<uni-th v-if="$check_field('get','interpretation')" align="center">
						<span>释义
						</span>
					</uni-th>
					<uni-th v-if="$check_field('get','picture')" align="center">
						<span>图片
						</span>
					</uni-th>
					<uni-th v-if="$check_field('get','word_category')" align="center">
						<span>单词类别
						</span>
					</uni-th>
					<uni-th v-if="$check_field('get','memory_skills')" align="center">
						<span>记忆技巧
						</span>
					</uni-th>
					<uni-th align="center">
						<span>
							点赞
						</span>
					</uni-th>
					<uni-th align="center">
						<span>
							点击数
						</span>
					</uni-th>
					<uni-th align="center">
						<span>
							创建时间
						</span>
					</uni-th>
					<uni-th align="center">
						<span>
							操作
						</span>
					</uni-th>
				</uni-tr>
				<uni-tr v-for="(o, i) in list" :key="i">
					<uni-td v-if="$check_field('get','word')" class="diy_field diy_text" align="center">
						<span>
							{{ o["word"] }}
						</span>
					</uni-td>
					<uni-td v-if="$check_field('get','interpretation')" class="diy_field diy_text" align="center">
						<span>
							{{ o["interpretation"] }}
						</span>
					</uni-td>
					<uni-td v-if="$check_field('get','picture')" class="diy_field diy_img" align="center">
						<image style="width:4rem;height: 4rem;" :src="$fullUrl(o['picture']) || '/static/img/default.png'" mode="scaleToFill" />
					</uni-td>
					<uni-td v-if="$check_field('get','word_category')" class="diy_field diy_text" align="center">
						<span>
							{{ o["word_category"] }}
						</span>
					</uni-td>
					<uni-td v-if="$check_field('get','memory_skills')" class="diy_field diy_text" align="center">
						<span>
							{{ o["memory_skills"] }}
						</span>
					</uni-td>
					<uni-td class="diy_field diy_number" align="center">
						<span>
							{{ o["praise_len"] }}
						</span>
					</uni-td>
					<uni-td class="diy_field diy_number" align="center">
						<span>
							{{ o["hits"] }}
						</span>
					</uni-td>
					<uni-td class="diy_field diy_time" align="center">
						<span>
							{{ $toTime(o["create_time"],"yyyy-MM-dd hh:mm:ss") }}
						</span>
					</uni-td>
					<uni-td align="center">
						<view @click="to_nav(o['encyclopedia_of_words_id'])" style="cursor: pointer;">查看详情</view>
					</uni-td>
				</uni-tr>
			</uni-table>
		</view>

		<view class="warp" v-show="show_Img">
			<view class="container">
				<view v-for="(o,i) in list" class="row box_style">
					<view class="col" v-if="1 && $check_field('get','word')">
						<view class="view">
							<view class="diy_title" v-if="true">
								<span>单词</span>
							</view>
							<view class="diy_field diy_text">
								<span>
									{{ o["word"] }}
								</span>
							</view>
						</view>
					</view>
					<view class="col" v-if="1 && $check_field('get','interpretation')">
						<view class="view">
							<view class="diy_title" v-if="true">
								<span>释义</span>
							</view>
							<view class="diy_field diy_text">
								<span>
									{{ o["interpretation"] }}
								</span>
							</view>
						</view>
					</view>
					<view class="col" v-if="0 && $check_field('get','pronunciation')">
						<view class="view">
							<view class="diy_title" v-if="true">
								<span>读音</span>
							</view>
							<view class="diy_field diy_text">
								<span>
									{{ o["pronunciation"] }}
								</span>
							</view>
						</view>
					</view>
					<view class="col" v-if="1 && $check_field('get','picture')">
						<view class="view">
							<view class="diy_title" v-if="false">
								<span>图片</span>
							</view>
							<view class="diy_field diy_img">
								<img :src="$fullUrl(o['picture'])" width="100%" height="100" />
							</view>
						</view>
					</view>
					<view class="col" v-if="1 && $check_field('get','word_category')">
						<view class="view">
							<view class="diy_title" v-if="true">
								<span>单词类别</span>
							</view>
							<view class="diy_field diy_text">
								<span>
									{{ o["word_category"] }}
								</span>
							</view>
						</view>
					</view>
					<view class="col" v-if="0 && $check_field('get','memory_skills')">
						<view class="view">
							<view class="diy_title" v-if="true">
								<span>记忆技巧</span>
							</view>
							<view class="diy_field diy_text">
								<span>
									{{ o["memory_skills"] }}
								</span>
							</view>
						</view>
					</view>
					<view class="bottom-view">
						<view class="praise-title">点赞数<span>{{ o["praise_len"] }}</span></view>
						<view class="hits-title">点击数<span>{{ o["hits"] }}</span></view>
					</view>
					<view class="col">
						<view class="view">
							<view class="create_time_block diy_filed diy_time">
								{{ $toTime(o["create_time"] ,"yyyy-MM-dd hh:mm:ss") }}
							</view>
						</view>
					</view>
					<view class="uni-padding-wrap uni-common-mt">
						<a :href="'./details?encyclopedia_of_words_id=' + o['encyclopedia_of_words_id']" class="btn btn-primary">查看详情</a>
					</view>
				</view>
			</view>
		</view>
		<!-- /列表 -->

		<!-- 分页器 -->
		<uni-pagination class="pager" show-icon="true" :total="count" :pageSize="query.size" :current="query.page"
						@change="page_change"></uni-pagination>
		<!-- /分页器 -->
	</view>
</template>

<script>
	import list_tab from "@/components/diy/list_tab.vue";
	import bar_orderby from "@/components/diy/bar_orderby.vue";
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		components: {
			list_tab,
			bar_orderby
		},
		data() {
			return {
				url_get_list: "~/api/encyclopedia_of_words/get_list?like=0",
				show_Img: true,
				//单词类别选项列表
				list_word_category: [],

					list_orderby: [
				{
					name: '点赞数',
					direction: "",
					command_asc: '`praise_len` asc',
					command_desc: '`praise_len` desc'
				},
				{
					name: '点击数',
					direction: "",
					command_asc: '`hits` asc',
					command_desc: '`hits` desc'
				},
				{
					name: '发布时间',
					direction: "",
					command_asc: '`create_time` asc',
					command_desc: '`create_time` desc'
				}
			],
					query: {
						"word": "", // 单词
						"interpretation": "", // 释义
						"word_category": "", // 单词类别
						"encyclopedia_of_words_id": 0, // ID
						"page": 1,
						"size": 10
			},
			list: [],
					count: 50,
		}
		},
		methods: {
	/**
	 * 获取列表后
	 * @param {Object} json
	 * @param {Object} func
	 */
	get_list_after(json ,func){
		var list = json.result.list;
		// list.map((o)=>{
		// 	o["praise_len"] = 0;
		// });
		this.get_praise(list);

		if (func) {
			func(json);
		}
	},

	/**
	 * 获取点赞数
	 * @param {Object} list
	 */
	get_praise(list){
		this.$get("~/api/praise/count_group?groupby=source_id&source_table=encyclopedia_of_words", {}, (res) => {
			if(res.result){
				res.result.map((o)=>{
					for(var i = 0;i < list.length; i++){
						var oj = list[i];
						if(oj["encyclopedia_of_words_id"] === o["source_id"]){
							oj["praise_len"] = o["count"];
							break;
						}
					}
				});
			}
			else if(res.error) {
				console.error(res.error);
			}
		});
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
			$.toast(json.error.message);
			console.error(json.error);
		}
	},

	input(e, key) {
		this.query[key] = e.value;
	},

	search() {
		this.query.page = 1;
		this.get_list();
	},

	// 改变分类标签
	changeScreen(idx,key) {
		if (this.query[key] === "全部") {
			this.query[key] = "";
		}
		this.search()
	},

	// 控制排序
	handleOrderby(o) {
		// console.log(o);
		// 取出对应的orderby

		// 重置其他排序的direction
		this.list_orderby.map(val => {
			if (val.name !== o.text) {
				return val.direction = ""
			}
		})

		// 找到对应的排序项，发送排序请求
		var obj_orderby = this.list_orderby.find(val => val.name === o.text)
		if (o.direction === "") {
			this.query.orderby = ""
			this.search()
		} else if (o.direction === "up") {
			this.query.orderby = obj_orderby.command_desc
			this.search()
		} else if (o.direction === "down") {
			this.query.orderby = obj_orderby.command_asc
			this.search()
		}
	},

	/**
	 * 跳转地址
	 * @param {Object} id
	 */
	to_nav(id) {
		this.$nav('/pages/encyclopedia_of_words/details?encyclopedia_of_words_id=' + id)
	},

	},
	created() {
		// 初始化单词类别列表
		this.get_list_word_category();
	}
	}
</script>

<style scoped>
	.container{
		box-shadow: none;
		-webkit-box-shadow: none;
	}
	.pager {
		margin-top: 1rem;
	}
	.uni-collapse {
		background-color: inherit;
	}

	.pager {
		margin-top: 1rem;
	}

	.tab_view {
		background-color: #FFFFFF;
		margin: 0 auto;
	}


	.list_orderby {
		display: flex;
		justify-content: flex-end;
		background-color: #FFFFFF;
		border-top: 5px double #ccc;
		border-bottom: 5px double #ccc;
		margin-right: -1px;
	}

	.list_orderby .bar_orderby {
		border-left: 1px solid #ccc;
	}
	.change_table{
		height: 50px;
		margin: 0 var(--margin_base)
	}
	.btn_change_table{
		margin-left: auto;
		font-weight: bold;
		width: 100px;
		height: 37px;
		text-align: center;
		font-size: 0.875rem;
		border: 1px solid #CCCCCC;
		border-radius: 1rem;
		margin: 0.25rem;
		float: right;
	}
	.end-title{
		display: flex;
	}
	.end-title view{
		flex-grow: 1;
		text-align: center;
	}
	.end-cont{
		display: none;
		background: #C8C7CC;
	}
	.btna{
		color: #FFFFFF;
		background: #00A0FF;
	}
	.dis{
		display: block;
	}
	.box_style{
		margin-bottom: 0.75rem;
		padding: 0.375rem;
		display: inline-block !important;
		border: 0.075rem solid #ccc;
		border-radius: 0.375rem;
		overflow: hidden;
	}
	.box_style:nth-child(even){
		margin-left: 0.60rem;
	}
	.box_style:nth-child(even){
		margin-left: 0.60rem;
	}
	.bottom-view,.create_time_block{
		font-size: 12px;
		color: #666666;
	}
	.bottom-view view{
		display: inline-block;
	}
	.bottom-view span{
		margin-left: 5px;
		margin-right: 10px;
	}
</style>
