<template>
	<view class="page_article" id="article_list">

		<template v-if="$check_action('/article/list','get')">
			<!-- 筛选模块(开始) -->
			<mm_warp class="warp_article">
				<mm_container class="container">
					<mm_row>
						<mm_col>
							<mm_view class="search_bar">
								<!-- 替换组件的搜索图标 -->
								<uni-search-bar radius="2rem" placeholder="搜索文章" @confirm="search" @cancel="cancel" cancelText="取消"
									@input="input($event, 'title')">
									<uni-icons slot="searchIcon" color="#999999" size="18" type="home" />
								</uni-search-bar>
							</mm_view>
						</mm_col>
					</mm_row>
					<mm_row>
						<mm_col>
							<mm_view class="tab_view">
								<!-- 筛选栏 -->
								<!--<list_tab activeColor="var(&#45;&#45;color_primary)" lineColor="var(&#45;&#45;color_primary)"-->
									<!--:list="types" v-model="query['type']" @change="changeTab('type')"></list_tab>-->
								<!--&lt;!&ndash; /筛选栏 &ndash;&gt;-->
								<select @change="search" v-model="query.type" style="display:block;width: 100%;background-color: rgb(248, 248, 248);position: relative;padding: 8px;flex-direction: row;margin-top: 8px;border-radius: 5px">
									<option value="">全部</option>
									<option v-for="(o,i) in types" :value="o">{{o}}</option>
								</select>
							</mm_view>
						</mm_col>
					</mm_row>
					<mm_row>
						<mm_col>
							<mm_view>
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
			<!-- 文章列表模块(开始) -->
			<mm_warp class="warp_article">
				<mm_container class="container">
					<mm_row>
						<mm_col>
							<mm_view style="padding-top: 0.5rem;">
								<!-- 文章列表 -->
								<list_article style="background-color: #fff;" :list="list" class="mb"></list_article>
								<!-- /文章列表 -->
							</mm_view>
						</mm_col>
					</mm_row>
				</mm_container>
			</mm_warp>
			<!-- 文章列表模块(结束) -->
			<!-- 换页器模块(开始) -->
			<mm_warp class="article_page_down">
				<mm_container class="container">
					<mm_row>
						<mm_col>
							<mm_view class="pager_view">
								<!-- 分页器 -->
								<uni-pagination class="pager" show-icon="true" :total="count" :pageSize="query.size"
									:current="query.page" @change="page_change"></uni-pagination>
								<!-- /分页器 -->
							</mm_view>
						</mm_col>
					</mm_row>
				</mm_container>
			</mm_warp>
			<!-- 换页器模块(结束) -->
		</template>
	</view>
</template>

<script>
	import list_article from "@/components/diy/list_article.vue";
	import bar_orderby from "@/components/diy/bar_orderby.vue"
	import list_tab from "@/components/diy/list_tab.vue"
	import mixin from "@/mixins/page.js";

	export default {
		mixins: [mixin],
		components: {
			list_article,
			bar_orderby,
			list_tab
		},
		data() {
			return {
				url_get_list: "~/api/article/get_list?like=0",
				list: [],
				query: {
					title: "",
					page: 1,
					size: 4,
					type: "",
				},
				list_orderby: [{
						name: '点击量',
						direction: "",
						command_asc: '`hits` asc',
						command_desc: '`hits` desc'
					},
					{
						name: '日期',
						direction: "",
						command_asc: '`create_time` asc',
						command_desc: '`create_time` desc'
					},
				],
				// 分类
				types: []
			}
		},
		methods: {
			/**
			 * 添加文章过滤
			 */
			get_article_type() {
				this.$get(
					"~/api/article_type/get_list", {
						page: 1,
						size: 0,
					},
					(res) => {
						if (res.result) {
							let list = res.result.list;
							list.map(obj => {
								this.types.push(obj.name)
							})
							console.log(this.types)
						}
					}
				);
			},

			/**
			 * 下拉商品筛选选择
			 */
			filter_item(name) {
				if (name.name == "全部") {
					this.query = {
						page: 1,
						size: 4,
					};
					this.get_list();
				} else {
					this.query.type = name.name;
					this.search();
				}
			},
			input(e, key) {
				this.query[key] = e.value;
			},
			search() {
				this.query.page = 1;
				this.get_list();
			},
			cancel() {
				console.log("eer");
				this.query.title = "";
				this.search();
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
			// 改变分类标签
			changeTab(key) {
				if (this.query[key] === "全部") {
					this.query.type = "";
				}
				this.search()
			}
		},
		mounted() {
			this.get_article_type();
		}
	}
</script>

<style scoped>
	#article_list {
	}

	#article_list .pager {
		margin-top: 1rem;
	}

	#article_list .list_orderby {
		display: flex;
		justify-content: flex-end;
		background-color: #FFFFFF;
		border-top: 5px double #ccc;
		border-bottom: 5px double #ccc;
		margin-right: -1px;
	}

	#article_list .list_orderby .bar_orderby {
		border-left: 1px solid #ccc;
	}
	#article_list .warp_article{
		background-color:#fff;
	}


	#article_list .tab_view {
		background-color: #FFFFFF;
		margin: 0 auto;
	}

	#article_list .dropdown_article {
		line-height: 40px;
	}
	.article_page_down{
		padding-bottom: 60px;
	}
</style>
