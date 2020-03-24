// Copyright 2020 Paul Sitoh
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import React from 'react';
import { Switch, Redirect } from 'react-router-dom';

import {
    Dashboard as DashboardView,
    NotFound as NotFoundView,
    MainLayout,
    MinimalLayout,
} from '../modules/components';

import {
    Auth as AuthContain,
} from '../modules/containers';
import RouteWithLayout from './RouteWithLayout';

const Routes = () => {
    return (
        <Switch>
            <Redirect exact from="/" to="/auth"/>
            <RouteWithLayout component={AuthContain} exact layout={MinimalLayout} path="/auth"/>
            <RouteWithLayout component={DashboardView} exact layout={MainLayout} path="/dashboard"/>
            <RouteWithLayout component={NotFoundView} exact layout={MinimalLayout} path="/not-found"/>
            <Redirect to="/not-found" />
        </Switch>
    );
};

export default Routes;