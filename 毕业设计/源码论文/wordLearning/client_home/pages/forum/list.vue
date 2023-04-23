<template>
	<view class="page_forum" id="forum_index">
		<!-- 论坛列表模块(开始) -->
		<mm_warp>
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<!-- 替换组件的搜索图标 -->
						<uni-search-bar placeholder="搜索帖子" @confirm="search" @cancel="cancel" cancelText="取消"
							@input="input($event, 'title')">
							<uni-icons slot="searchIcon" color="#999999" size="18" type="home" />
						</uni-search-bar>
					</mm_col>
				</mm_row>
				<mm_row>
					<mm_col>
						<mm_view class="">
							<template v-if="$check_action('/forum/list','get')">
								<!-- 论坛列表 -->
								<list_forum style="background-color: #fff;" :list="list" class="mb"></list_forum>
								<!-- /论坛列表 -->
							</template>
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!-- 论坛列表模块(结束) -->
		<!-- 分页器模块(开始) -->
		<mm_warp>
			<mm_container class="container">
				<mm_row>
					<mm_col>
						<mm_view class="">
							<!-- 分页器 -->
							<uni-pagination class="pager" show-icon="true" :total="count" :pageSize="query.size"
								:current="query.page" @change="page_change"></uni-pagination>
							<!-- /分页器 -->
						</mm_view>
					</mm_col>
				</mm_row>
			</mm_container>
		</mm_warp>
		<!-- 分页器模块(结束) -->
	</view>
</template>

<script>
	import mixin from "@/mixins/page.js"
	import list_forum from "@/components/diy/list_forum.vue"


	export default {
		mixins: [mixin],
		components: {
			list_forum,
		},
		data() {
			return {
				url_get_list: "~/api/forum/get_list?like=0",
				list: [],
				query: {
					title: "",
					page: 1,
					size: 2
				},
				list_forum_type: [],
				type_names: [],
				filter_title: '筛选',
				sort_title: '排序',
				sort_list: [{
						name: '热度从高到低',
						value: '`hits` desc'
					},
					{
						name: '热度从低到高',
						value: '`hits` asc'
					},
					{
						name: '更新时间从高到低',
						value: '`create_time` desc'
					},
					{
						name: '更新时间从低到高',
						value: '`create_time` asc'
					},
				]
			}
		},
		methods: {
			/**
			 * 添加论坛内容过滤
			 */
			get_forum_type() {
				this.$get(
					"~/api/forum_type/get_list", {
						page: 1,
						size: "0",
					},
					(res) => {
						if (res.result) {
							this.list_forum_type = res.result.list;
							this.type_names.push("全部")
							this.list_forum_type.map(o => this.type_names.push(o.name))
						}
					}
				);
			},
			/**
			 * 下拉筛选选择
			 */
			filter_item(name) {
				if (name.name == "全部") {
					this.query = {
						page: 1,
						size: 10,
					};
					this.get_list();
				} else {
					this.query.type = name.name;
					this.search();
				}
			},
			/**
			 *下拉排序
			 */
			sort_item(o) {
				this.query.orderby = o.name.value;
				this.search()
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
			}
		},
		mounted() {
			this.get_forum_type();
		}
	}
</script>

<style scoped>
	.forum_list .chat-custom-right {
		font-size: 0.875rem;
		line-height: 1.5;
		text-align: right;
		color: #777;
	}

	.forum_list .praise {
		position: relative;
		top: 0.125rem;
	}

	.forum_list .praise::before {
		content: "";
		display: inline-block;
		width: 1rem;
		height: 1rem;
		background: url('/static/img/praise.png') 100% 100% no-repeat;
		position: relative;
		top: 0.125rem;
		margin-right: 0.25rem;
	}

	.forum_list .see {
		margin-left: 1rem;
		position: relative;
		top: 0.125rem;
	}

	.forum_list .see::before {
		content: "";
		display: inline-block;
		width: 1rem;
		height: 1rem;
		background: url('/static/img/see.png') 100% 100% no-repeat;
		position: relative;
		top: 0.125rem;
		margin-right: 0.25rem;
	}

	.forum_list .time {
		color: #999;
	}

	.pager {
		margin-top: 1rem;
	}

	.uni-collapse {
		background-color: inherit;
	}

	.top_handle {
		position: relative;
		height: 2.6rem;
		width: 100%;
	}

	.dropdown_box {
		width: 100%;
		display: flex;
		position: absolute;
		z-index: 1000;
	}

	.dropdown_box>* {
		flex: 1
	}

	.dropdown_forum {
		line-height: 40px;
	}

	.dropdown_forum .dropdown_title {
		padding-left: 10px;
		background-color: var(--bg_white);
	}

	.dropdown_item {
		font-size: 14px;
		padding-left: 20px;
		background-color: var(--bg_white);
	}

	.icon_dropdown {
		margin-left: 10px;
	}
</style>
